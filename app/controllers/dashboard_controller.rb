class DashboardController < ApplicationController
    before_action :authenticate_user!
    def show
        @new_orders = current_user.receipt.where(status: "Buyer Paid").count
        @total_forms = current_user.form.count
        @total_products = current_user.product.count
        @total_orders = current_user.receipt.count
    end
end
