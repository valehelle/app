class FormController < ApplicationController
    def index
        @forms = current_user.form.all
    end

    def view
        @form = Form.find_by(ref_id: "4AFe")
    end

    def new
        @form = current_user.form.build
    end
    def create
        @form = current_user.form.build(form_params)
        @form.save!
        @products = @form.product.where(user_id: nil)
        @products.each do |product|
            puts product.name
            product.user_id = current_user.id
            product.form_id = @form.id
            product.save!
        end
        redirect_to edit_form_path(@form)
    end

    def edit
        @form = current_user.form.find(params[:id])
    end

    def update
        @form = current_user.form.find(params[:id])
        @form.update_attributes(form_params)
        
        @products = @form.product.where(user_id: nil)
        @products.each do |product|
            product.user_id = current_user.id
            product.save!
        end
        redirect_to form_index_path
    end

    private 
        def form_params
            params.require(:form).permit(:name, product_attributes: [:name, :id, :user_id], user_attributes: [:id])
        end
end
