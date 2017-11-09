class Atelier < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  validates :date, :user, :skill, presence: true
end
