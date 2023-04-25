class Admin::OrdersItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_item.update(order_item_params)
    #もし製作ステータスが製作中であればorderステータスを2に更新する
    if @order_item.product_status == "in_production"
      @order.update(status: 2)
    #商品の個数と製作ステータスの「製作完了」の商品カウント数が一致すればorderのステータスを3で更新する
    elsif @order.order_items.count == @order.order_items.where(product_status: "production_complete").count
      @order.update(status: 3)
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:product_status)
  end

end