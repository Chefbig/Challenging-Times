class ProductsController < ApplicationController
  def index
    @products = Product.order(:name)
  end

  def view
    @product = Product.find(params[:id])
  end
end
