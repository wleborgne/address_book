class City < ActiveRecord::Base
  validates :name, presence: true
  validates :state, presence: true
  validates :population, allow_blank: true,
    numericality: { greater_than_or_equal_to: 0 }
  validates :elevation, allow_blank: true, 
    numericality: { greater_than_or_equal_to: 3315,
      if: lambda { |city| city.state == 'CO' || city.state == 'Colorado'},
      message: 'is too low. Lowest point in CO is 3315 feet.' }
end
