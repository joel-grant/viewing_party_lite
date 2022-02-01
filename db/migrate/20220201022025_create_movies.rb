class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :runtime
      t.string :genre
      t.string :image_url
      t.text :summary

      t.timestamps
    end
  end
end
