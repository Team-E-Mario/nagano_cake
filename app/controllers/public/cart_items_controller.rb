class Public::CartItemsController < ApplicationController
  # 一覧表示
  def index
    @cart_items = current_customer.cart_items
    @total_price = @cart_items.sum{|cart_item|cart_item.item.price_without_tax * cart_item.quantity * 1.1}
    # sumで合計金額を出す
    # cart_item.item.price_without_tax * cart_item.quantity * 1.1＝カート商品の商品(単体)の税抜価格✖️カート商品の個数✖️消費税
  end

  # カートに商品を追加する
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = params[:item_id]
    if @cart_item.save
      flash[:notice] = "#{@cart_item.item.name}をカートに追加しました。"
      redirect_to cart_items_path
    else
      flash[:alert] = "個数を選択してください"
      render "/items/show"
    end
  end

  # 削除や個数を変更した際に再計算する
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  # カート内の商品を１つ削除
  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_item.destroyl
    flash[:alert] = "#{@cart_item.item.name}を削除しました"
    redirect_to customers_cart_items_path
  end

  # カート内を空にする
  def destroy_all
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    flash[:alert] = "カート内の商品を全て削除しました"
    redirect_to cart_item_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id, :customer_id)
  end

end