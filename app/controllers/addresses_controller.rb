class AddressesController < ApplicationController
  def index
  end

  def create
    @order = Order.new(price: order_params[:price])
  end
  
  private

  def address_params
    params.require(:address).permit(:postcode, :prefecture,:city, :address, :phone_number :ship_area_id, :ship_days_id, :price, :image).merge(user_id: current_user.id)
  end

end
