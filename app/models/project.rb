class Project < ApplicationRecord
  belongs_to :user
  enum category: { construction: "construction", seminar: "seminar", conference: "conference", training: "training", marketing: "marketing" }
  has_many_attached :images
end
