class ReceiptController < ApplicationController
    layout :resolve_layout
    before_action :authenticate_user!, except: [:payment_update,:view,:receipt_view,:create]

    def index
        status = params[:status]
        per_page = 20
        if(status == "1")
            @receipts = current_user.receipt.where(status: "Waiting Payment").paginate(:page => params[:page], :per_page => per_page).order('id DESC')
        elsif (status == "2")
            @receipts = current_user.receipt.where(status: "Buyer Paid").paginate(:page => params[:page], :per_page => per_page).order('id DESC')
        elsif (status == "3")
            puts "helo"
            @receipts = current_user.receipt.where(status: "Shipped").paginate(:page => params[:page], :per_page => per_page).order('id DESC')
        else
            @receipts = current_user.receipt.all.paginate(:page => params[:page], :per_page => per_page).order('id DESC')
        end
    end

    def show
        @receipt = Receipt.find_by(id: params[:id])
    end

    def destroy
        current_user.receipt.find(params[:id]).destroy
        flash[:success] = "Receipt deleted"
        redirect_to receipt_index_path
    end

    def payment_update
        @receipt = Receipt.find_by(ref_id: params[:id])
        @receipt.update_attributes(update_params)
        @receipt.status = "Buyer Paid"
        @receipt.save!
        
        redirect_to receipt_view_path(@receipt.ref_id)
    end

    def shipment_update
        @receipt = Receipt.find_by(id: params[:id])
        @receipt.update_attributes(update_params)
        @receipt.status = "Shipped"
        @receipt.save!

        flash[:success] = "Receipt Shipment Updated"
        redirect_to receipt_path(@receipt.id)
    end

    def view
        @form = Form.find_by(ref_id: params[:id])
        @company = @form.user.company
        @receipt = Receipt.new(user_id: @form.user_id, form_id: @form.ref_id)
        @form.product.each do |product|
            @receipt.productreceipt.build(name: product.name,price: product.price,desc: product.desc, product_id: product.id, shipping_price: product.shipping_price)
        end
        @isreceipt = false
    end

    def receipt_view
        @receipt = Receipt.find_by(ref_id: params[:id])
        @form = Form.find_by(id: @receipt.form_id)
        @company = @form.user.company
        @isreceipt = true
        render :template => "receipt/view"
    end

    def create
        @form = Form.find_by(ref_id: params[:receipt][:form_id])
        params[:receipt][:productreceipt_attributes].values.each do |productreceipt|
            @product = @form.product.find_by(id: productreceipt[:product_id])
            if !productreceipt[:qty].blank?
                if !(Integer(@product.stock) >= Integer(productreceipt[:qty]))
                    redirect_to form_view_path(@form.ref_id)
                    return 
                end
            end
        end

        @receipt = Receipt.new(user_id: @form.user_id, form_id: @form.id, customer_name: params[:receipt][:customer_name], customer_email: params[:receipt][:customer_email],customer_phone: params[:receipt][:customer_phone],shipping_address: params[:receipt][:shipping_address] ,shipping_state: params[:receipt][:shipping_state], shipping_poskod: params[:receipt][:shipping_poskod], shipping_city: params[:receipt][:shipping_city], shipping_country: params[:receipt][:shipping_country])

        total = 0

        isproduct = false

        params[:receipt][:productreceipt_attributes].values.each do |productreceipt|
            @product = @form.product.find_by(id: productreceipt[:product_id])
            if !(productreceipt[:qty].blank?) && (Integer(productreceipt[:qty]) > 0)
                isproduct = true
                @productreceipt = @receipt.productreceipt.build(productreceipt)
                @productreceipt.name = @product.name
                @productreceipt.desc = @product.desc
                @productreceipt.price = @product.price
                @productreceipt.user_id = @product.user_id
                @productreceipt.shipping_price = @product.shipping_price * @productreceipt.qty
                subtotal = @productreceipt.price * @productreceipt.qty
                total = total + subtotal + @productreceipt.shipping_price
                @productreceipt.subtotal = subtotal
                @productreceipt.save!

                @product = @form.product.find_by(id: productreceipt[:product_id])
                @product.stock = @product.stock - Integer(productreceipt[:qty])
                @product.save!
            end
            @receipt.total = total
        end
        if (isproduct)
            if(@receipt.save)
                CustomerMailer.receipt_email("hazmiirfan92@gmail.com").deliver_now
                redirect_to receipt_view_path(@receipt.ref_id)
            elsif
                flash[:success] = "Please fill in all the required details"
                redirect_to form_view_path(@form.ref_id)
            end
        elsif
            flash[:success] = "You must select at least one product"
            redirect_to form_view_path(@form.ref_id)
        end
    end

    
    private 

    def form_params
        params.require(:receipt).permit(:name, productreceipt_attributes: [:name, :id, :user_id, :desc, :price, :qty ], user_attributes: [:id], form_attributes: [:id])
    end

    def update_params
        params.require(:receipt).permit(:pay_img, :pay_txt, :shipping_number, :shipping_courier)
    end

    def resolve_layout
        case action_name
        when "view","receipt_view"
            "empty"
        else
            "application"
        end
    end

end
