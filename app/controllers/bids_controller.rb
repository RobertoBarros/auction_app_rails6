class BidsController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    value = params[:bid_value]
    @bid = Bid.new(product: product, user: current_user, value: value)
    @bid.save
    broadcast()


  end

  private

  def broadcast
    bidHTML = ApplicationController.renderer.render( partial: 'bids/bid', locals: { bid: @bid })
    productPrice = view_context.number_to_currency(@bid.product.final_price)
    ProductChannel.broadcast_to @bid.product, bidHTML: bidHTML, productPrice: productPrice
  end
end
