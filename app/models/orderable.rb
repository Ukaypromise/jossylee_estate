class Orderable < ApplicationRecord
  belongs_to :property
  belongs_to :order

  def total
    property.price
  end

end
