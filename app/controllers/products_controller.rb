class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]
  def index
    @products = Product.in_auction.all
  end

  def show
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
