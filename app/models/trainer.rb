class Trainer < ApplicationRecord
  has_many :pocket_monsters

  validates :name, presence: true
  validates :age, presence: true
  validates :leader, presence: true

  def sorted_by_creation
  end
end
