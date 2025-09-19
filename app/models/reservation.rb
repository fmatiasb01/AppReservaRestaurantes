class Reservation < ApplicationRecord
  belongs_to :table
  validates :name, :people_count, :reservation_time, presence: true
end
