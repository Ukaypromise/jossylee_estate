class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy

    def add_property(property)
        current_item = line_items.find_by(property_id: property.id)
        if current_item
            current_item.increment(:quantity)
            # current_item.quantity += 1
        else
            current_item = line_items.build(property_id: property.id)
        end 
        current_item
    end

    def total_price
        line_items.to_a.sum { |item| item.total_price }
    end 
end
