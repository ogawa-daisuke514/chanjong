class CreateExposedTiles < ActiveRecord::Migration[6.1]
  def change
    create_table :exposed_tiles do |t|
      t.integer :tile_definition_id
      t.integer :exposed_piece_id
      t.boolean :robbed

      t.timestamps
    end
  end
end
