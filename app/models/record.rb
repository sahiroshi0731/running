class Record < ApplicationRecord
  validates :run_day, presence: true 
  validates :run_distance, numericality: true
  validates :run_distance, inclusion: { in: 0..999}
end
