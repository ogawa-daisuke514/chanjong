class CreateExposedPieces < ActiveRecord::Migration[6.1]
  def change
    create_table :exposed_pieces do |t|
      t.integer :goal_example_id

      t.timestamps
    end
  end
end
