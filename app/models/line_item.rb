class LineItem < ApplicationRecord
  belongs_to :property
  belongs_to :cart

  def total_price
    property.price.to_i * quantity.to_i
  end
end
