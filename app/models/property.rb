class Property < ApplicationRecord
    before_destroy :not_referenced_by_any_line_item
    belongs_to :user, optional: true # remove later optional: true
    has_many_attached :images
    has_many :line_items

    private

    def not_referenced_by_any_line_item
        unless line_items.empty?
            errors.add(:base, 'Line items present')
            throw :abort
        end
    end 
end
