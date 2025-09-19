class Table < ApplicationRecord
  has_many :reservations
  validates :name, :capacity, presence: true
end
