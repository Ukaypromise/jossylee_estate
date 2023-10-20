class Property < ApplicationRecord
  before_create :set_user_id
  before_destroy :not_referenced_by_any_line_item
  belongs_to :user, optional: true # remove later optional: true
  has_many_attached :images
  has_many :line_items

  has_many :orderables
  has_many :orders, through: :orderables

  private

  def set_user_id
    self.user_id = user.id
  end

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
end
