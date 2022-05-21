class SleepQuality < ApplicationRecord
  belongs_to :user
  has_many :boolean_data_points
  has_many :integer_data_points
  has_many :time_data_points
end
