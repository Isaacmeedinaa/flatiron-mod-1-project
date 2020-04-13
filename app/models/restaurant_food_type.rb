class RestaurantFoodType < ActiveRecord::Base
  has_many :restaurants
  has_many :reviews, through: :restaurants
end