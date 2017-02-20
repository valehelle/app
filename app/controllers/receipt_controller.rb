class ReceiptController < ApplicationController
    layout :resolve_layout

    def index
        status = params[:status]
        if(status == "1")
            @receipts = current_user.receipt.where(status: "Waiting Payment")
        elsif (status == "2")
            @receipts = current_user.receipt.where(status: "Buyer Paid")
        elsif (status == "3")
            puts "helo"
            @receipts = current_user.receipt.where(status: "Shipped")
        else
            @receipts = current_user.receipt.all
        end
    end
    def view
        @form = Form.find_by(ref_id: params[:id])
        @company = @form.user.company
        @receipt = Receipt.new(user_id: @form.user_id, form_id: @form.ref_id)
        @form.product.each do |product|
            @receipt.productreceipt.build(name: product.name,price: product.price,desc: product.desc)
        end
    end
    def create
        @form = Form.find_by(ref_id: params[:receipt][:form_id])
        @receipt = Receipt.new(user_id: @form.user_id, form_id: @form.id, customer_name: params[:receipt][:customer_name], customer_email: params[:receipt][:customer_email],customer_phone: params[:receipt][:customer_phone],shipping_address: params[:receipt][:shipping_address] ,shipping_state: params[:receipt][:shipping_state], shipping_poskod: params[:receipt][:shipping_poskod])
        @receipt.save!

        @form.product.zip(params[:receipt][:productreceipt_attributes].values).each do |product, productreceipt|
            if !productreceipt[:qty].blank?
                @receipt.productreceipt.build(name: product.name, qty: productreceipt[:qty])
                @receipt.save!
            end
        end
        redirect_to receipt_index_path 
    end

    
    private 

    def form_params
        params.require(:receipt).permit(:name, productreceipt_attributes: [:name, :id, :user_id, :desc, :price, :qty ], user_attributes: [:id], form_attributes: [:id])
    end

    def resolve_layout
        case action_name
        when "view"
            "empty"
        else
            "application"
        end
    end

end
