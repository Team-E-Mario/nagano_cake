class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @params = params[:id]
    @order = Order.where(customer_id: @params).page(params[:page]).per(10).order(created_at: :desc) #作成日を降順に並び替え
    @orders = Order.page(params[:page]).per(10).order(created_at: :desc)
  end
end
