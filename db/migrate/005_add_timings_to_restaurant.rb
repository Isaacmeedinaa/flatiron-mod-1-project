class AddTimingsToRestaurant < ActiveRecord::Migration[4.2]
    def change
        add_column :restaurants, :timings, :string
    end
end