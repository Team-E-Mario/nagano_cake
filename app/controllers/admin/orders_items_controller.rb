class Admin::OrdersItemsController < ApplicationController
  before_action :authenticate_admin!
end
