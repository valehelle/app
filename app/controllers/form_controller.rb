class FormController < ApplicationController
    before_action :authenticate_user!
    def index
        per_page = 20
        @forms = current_user.form.all.paginate(:page => params[:page], :per_page => per_page).order('id DESC')
    end

    def show
        @form = current_user.form.find(params[:id])
    end

    def new()
        if Company.exists?(user_id: current_user.id)
            @form = current_user.form.build
        else
            flash[:success] = "You need to add Company details first."
            redirect_to company_index_path()
        end
    end
    def create
        @form = current_user.form.build(form_params)
        if @form.save
            @products = @form.product.where(user_id: nil)
            @products.each do |product|
                product.user_id = current_user.id
                product.form_id = @form.id
                product.save!
            end
            redirect_to form_path(@form.id)
        else
            render :new
        end
    end

    def edit
        @form = current_user.form.find(params[:id])
    end

    def update
        @form = current_user.form.find(params[:id])
        @form.update_attributes(form_params)
        @form.save
        
        @products = @form.product.where(user_id: nil)
        @products.each do |product|
            product.user_id = current_user.id
            product.save!
        end
        flash[:success] = "Form Updated"
        redirect_to form_path(@form.id)
    end

    def destroy
        current_user.form.find(params[:id]).destroy
        flash[:success] = "Form deleted"
        redirect_to form_index_path
    end

    private 
    def form_params
        params.require(:form).permit(:name, product_attributes: [:name, :id, :user_id, :desc, :price, :stock, :_destroy ], user_attributes: [:id])
    end
end
