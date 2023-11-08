class Property < ApplicationRecord
  before_create :set_user_id
  belongs_to :user, optional: true # remove later optional: true
  has_many_attached :images
  has_many :order_items

  has_many :orderables, dependent: :destroy
  has_many :orders, through: :orderables

  private

  def set_user_id
    self.user_id = user.id
  end

end
