class Property < ApplicationRecord
  before_create :set_user_id
  belongs_to :user, optional: true # remove later optional: true
  has_many_attached :images
  has_many :order_items

  has_many :orderables, dependent: :destroy
  has_many :orders, through: :orderables

  validates :name, presence: true
  validates :description, presence: true
  validates :property_type, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :plot_size, presence: true
  validates :property_status, presence: true
  validates :availability, presence: true
  validates :owner_agent, presence: true

  private

  def set_user_id
    self.user_id = user.id
  end

end
