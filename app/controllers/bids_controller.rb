class BidsController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    value = params[:bid_value]
    @bid = Bid.new(product: product, user: current_user, value: value)
    @bid.save
  end
end
