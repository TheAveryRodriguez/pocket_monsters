class Trainer < ApplicationRecord
  has_many :pocket_monsters

  validates :name, presence: true
  validates :age, presence: true
  validates :leader, presence: true
end
