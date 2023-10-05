class Property < ApplicationRecord
    belongs_to :user, optional: true # remove later optional: true
    has_many_attached :images
    has_one :cart
end
