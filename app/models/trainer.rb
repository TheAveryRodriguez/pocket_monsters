class Trainer < ApplicationRecord
  has_many :pocket_monsters

  validates :name, presence: true
  validates :age, presence: true
  validates :leader, presence: true

  # Class methods contains self.
  # Instance methods do not

  def self.recently_created
    order(created_at: :desc)
  end
end
