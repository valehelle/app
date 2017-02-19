class ReceiptController < ApplicationController
    def index
        @receipts = current_user.receipt.all
    end
    def view
        @form = Form.find_by(ref_id: params[:id])
        @receipt = Receipt.new(user_id: @form.user_id, form_id: @form.ref_id)
        @form.product.each do |product|
            @receipt.productreceipt.build(name: product.name)
        end
        
        
    end
    def create
        @form = Form.find_by(ref_id: params[:receipt][:form_id])
        @receipt = Receipt.new(user_id: @form.user_id, form_id: @form.id)
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
end
