class ProductController < ApplicationController
    before_action :authenticate_user!
    
    def index
        per_page = 20
        @products = current_user.product.all.paginate(:page => params[:page], :per_page => per_page).order('id DESC')
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
