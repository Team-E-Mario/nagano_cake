class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    @genres = Category.all
  end

  def about
  end
end
