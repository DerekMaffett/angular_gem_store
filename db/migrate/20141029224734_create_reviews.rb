class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.text :body
      t.string :author

      t.timestamps null: false
    end
  end
end
