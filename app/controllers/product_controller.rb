class ProductController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @products = current_user.product.all
    end
    
    def show
        @product = current_user.product.find(params[:id])
    end

    def new
    end

    def create
        @product = current_user.product.build(product_params)
        @product.save!
        redirect_to product_index_path()
    end


    private 
        def product_params
            params.require(:product).permit(:name,:form_id)
        end
end
