class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @order = AddressManagement.new
  end

  def create
    @order = AddressManagement.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def order_params
  params.permit(:postcode, :prefecture_id, :city, :address, :building, :phone_number,:token,:item_id).merge(user_id: current_user.id)
  end

  def item_params
    params.require(:item_id).permit(:name, :details, :category_id, :condition_id, :delivery_fee_id, :ship_area_id, :ship_days_id, :price, :image).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency:'jpy'                 
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
   if current_user.id == @item.user_id || @item.management != nil
     redirect_to root_path
   end
  end
end
