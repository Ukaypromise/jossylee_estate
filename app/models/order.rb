class Order < ApplicationRecord

  has_many :orderables, dependent: :destroy
  has_many :properties, through: :orderables
  belongs_to :user

  def total_price
    # properties.to_a.sum(&:price)
    orderables.to_a.sum { |orderable| orderable.total }
  end
end
