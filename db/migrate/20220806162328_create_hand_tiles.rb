class CreateHandTiles < ActiveRecord::Migration[6.1]
  def change
    create_table :hand_tiles do |t|
      t.integer :goal_example_id
      t.integer :tile_definition_id

      t.timestamps
    end
  end
end
