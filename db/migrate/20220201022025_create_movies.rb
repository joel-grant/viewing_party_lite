class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :db_id
      t.string :title
      t.string :poster_path
      t.string :genre_ids
      t.text :overview
      t.float :vote_average

      t.timestamps
    end
  end
end
