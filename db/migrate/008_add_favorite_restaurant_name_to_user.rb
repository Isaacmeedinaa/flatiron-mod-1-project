class AddFavoriteRestaurantNameToUser < ActiveRecord::Migration[4.2]
    def change
        add_column :users, :favorite_restaurant_name, :string
    end
end