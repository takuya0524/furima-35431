class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]



  def index
    @items = Item.includes(:user).order("created_at DESC")
    query = "SELECT * FROM items"
    @items = Item.find_by_sql(query)
  end

  def  new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :state_id, :burden_id, :prefecture_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end


end