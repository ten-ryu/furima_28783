class ProductsController < ApplicationController
  def index
    @products = Product..order("created_at DESC")

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :shared/error_messages
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :ditails, :category, :condition, :delivery_fee, :ship_area, :ship_day, :price, presence: true)
  end
end
