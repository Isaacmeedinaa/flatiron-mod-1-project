class CreateRestaurantFoodTypes < ActiveRecord::Migration[4.2]
    def change
        create_table :restaurant_food_types do |t|
            t.string :name
        end
    end
end