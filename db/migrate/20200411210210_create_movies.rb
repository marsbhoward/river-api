class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
 	  t.string :title
 	  t.string :year
 	  t.string :youtube_id
      t.references :stream,null: false, foreign_key: true

      t.timestamps
    end
  end
end
