class ReceiptController < ApplicationController
    def index
    end
    def view
        @form = Form.find_by(ref_id: params[:id])
        @receipt = current_user.receipt.new
        @form.product.each do |product|
            puts product.name
            @receipt.productreceipt.build(name: product.name)
        end
        
        
    end
    def create
    
    end
end
