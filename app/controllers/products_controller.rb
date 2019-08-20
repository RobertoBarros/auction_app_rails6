class ProductsController < ApplicationController
  def index
    @products = Product.in_auction.all
  end

  def show
  end
end
