class CompanyController < ApplicationController
    before_action :authenticate_user!

    def index
        @company = current_user.company
        if !@company
            redirect_to action:"new"
        end
        
    end

    def new
        
    end

    def create
        @company = current_user.build_company(company_params)
        @company.save
        redirect_to company_index_path()
    end

    def edit
        @company = Company.find(params[:id])
        if @company.user_id == current_user.id
            puts "same user"
        else
            puts "NOT SAME"
        end
    end

    def update
        @company = Company.find(params[:id])
        if @company.user_id == current_user.id
            @company.update_attributes(company_params)
            redirect_to company_index_path()
        else
            puts "NOT SAME"
        end
    end


    private 
        def company_params
            params.require(:company).permit(:name, :address, :state, :poskod, :country, :email, :phone, :payment_method, :banner)
        end
end
