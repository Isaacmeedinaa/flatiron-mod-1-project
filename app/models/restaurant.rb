class Restaurant < ActiveRecord::Base
  belongs_to :restaurant_food_type
  has_many :reviews
  has_many :users, through: :reviews
end