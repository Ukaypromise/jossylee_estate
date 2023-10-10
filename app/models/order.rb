class Order < ApplicationRecord
    has_many :orderables
    has_many :properties, through: :orderables

    def total_price
        # properties.to_a.sum(&:price)
        orderables.to_a.sum { |orderable| orderable.total }
    end
end
