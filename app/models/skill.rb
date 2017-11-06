class Skill < ApplicationRecord
  has_many :users, through: :ateliers
  has_many :ateliers
  # has_attachment :photo
end
