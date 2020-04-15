class AddPriceRangeToRestaurant < ActiveRecord::Migration[4.2]
    def change
        add_column :restaurants, :price_range, :integer
    end
end