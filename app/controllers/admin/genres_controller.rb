class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @categories = Category.all
    @category = Category.new
  end

  def edit
  end
  
  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to admin_genres_path
  end
  
  def update
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end
  
end
