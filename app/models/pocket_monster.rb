class PocketMonster < ApplicationRecord
  belongs_to :trainer

  validates :name, presence: true
  validates :level, presence: true
  validates :captured, presence: [true, false]
end
