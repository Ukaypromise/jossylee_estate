class Project < ApplicationRecord
  belongs_to :user
  enum category: { construction: "Construction", seminar: "Seminar", conference: "Conference", training: "Training", marketing: "Marketing" }
  has_many_attached :images
  has_rich_text :description

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
