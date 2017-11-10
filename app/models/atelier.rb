class Atelier < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  validates :date, presence: true
end
