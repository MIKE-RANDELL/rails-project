class OrdersController < ApplicationController


  def new
    @order = Order.new
    @order.order_items.build
    @order.order_items.build
  end

  def create
    @user = current_user
    @account = Account.find_or_create_by(user_id: @user.id)
    @account.orders.create(params_check)
    redirect_to user_account_path(@user.id)
  end

  private
  def params_check
    params.require(:order).permit(:date, :order_items_attributes => [:order_id, :item_id, :quantity])
  end
end
