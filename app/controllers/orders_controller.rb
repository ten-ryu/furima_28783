class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = AddressManagement.new
  end

  def create
    @order = AddressManagement.new(order_params)
    @item = Item.find(params[:item_id])
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

end
