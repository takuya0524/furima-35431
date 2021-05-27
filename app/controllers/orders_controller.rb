class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]


  def index
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:postal_code, :prefecture_id, :city, :telephone_number, :street_address, :building_name).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end

  def contributor_confirmation
    redirect_to root_path if current_user == @item.user || @item.order != nil
    # ログインユーザー = 出品者だったら
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

