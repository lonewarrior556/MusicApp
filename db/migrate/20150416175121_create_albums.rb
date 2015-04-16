class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.text :title, null: false
      t.boolean :live_recording
      t.timestamps null: false
    end

    add_index :albums, :band_id
    add_index :albums, :title
  end
end
