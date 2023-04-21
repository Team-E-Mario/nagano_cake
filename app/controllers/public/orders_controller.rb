class Public::OrdersController < ApplicationController

  def index
    @orders = current_customer.orders
  end

  def new
    @order = Order.new
    @delivery_addresses = current_customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    params[:order][:payment_method] = params[:order][:payment_method].to_i
    @order.freight = 800
    @cart_items = current_customer.cart_items

    # ここがよく分からない
    # @item_total_price = 0 #商品合計金額(税込)
    # current_user.cart_items.each do |cart_item|
    # subtotal_price = cart_item.item.price * cart_item.item_count * 110 / 100 #小計(税込)
    # @item_total_price = 0 += subtotal_price
    # end
    # @order.billing_amount = @item_total_price + @order.shipping #請求金額(税込)=商品合計金額+送料

    # 配送先の条件分岐
    if params[:order][:address_option] == "0"
      @order.delivery_postcode = current_customer.postcode
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.delivery_postcode = @address.postcode
      @order.delivery_address = @address.address
      @order.delivery_name = @address.name
    else params[:order][:address_option] == "2"
    end

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    #@order.freight = 800
    @order.save
    redirect_to thanx_path
  end

  def show
  end

  def thanx
  end


  private

  def order_params
   params.require(:order).permit(:delivery_postcode, :delivery_address, :delivery_name, :billing_amount, :payment_method)
  end


end
