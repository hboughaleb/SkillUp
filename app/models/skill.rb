class Skill < ApplicationRecord
  belongs_to :user
  has_many :ateliers
  has_attachment :photo
  validates :name, presence: true
  validates :description, presence: true
end
