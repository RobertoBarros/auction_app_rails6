class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :product
  after_create :update_product_price

  def update_product_price
    current_price = product.final_price || product.initial_price
    product.update!(final_price: current_price + value)
  end

end
