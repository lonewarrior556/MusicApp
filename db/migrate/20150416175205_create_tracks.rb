class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.text :title
      t.integer :album_id, null: false
      t.text :version #bonus" or "regular
      t.text :lyrics
      t.timestamps null: false
    end
    add_index :tracks, :album_id
  end
end
