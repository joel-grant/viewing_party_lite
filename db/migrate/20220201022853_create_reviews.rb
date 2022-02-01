class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :author
      t.references :movie, foreign_key: true
      t.text :description
      t.float :rating

      t.timestamps
    end
  end
end
