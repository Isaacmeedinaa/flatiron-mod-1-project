class CreateReviews < ActiveRecord::Migration[4.2]
    def change
        create_table :reviews do |t|
            t.string :review_text
            t.integer :rating
            t.integer :user_id # foreign key
            t.integer :restaurant_id # foreign key
            t.timestamps
        end
    end
end