class Project < ApplicationRecord
  belongs_to :user
  enum category: { construction: "construction", seminar: "seminar", conference: "conference", training: "training", marketing: "marketing" }
  has_many_attached :images

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
