class Restaurant < ApplicationRecord
  # relationships
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: %w[japanese chinese italian french belgian] }
end
