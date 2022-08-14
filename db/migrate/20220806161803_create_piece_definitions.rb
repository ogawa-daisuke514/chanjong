class CreatePieceDefinitions < ActiveRecord::Migration[6.1]
  def change
    create_table :piece_definitions do |t|
      t.string :name
      t.boolean :natural
      t.integer :piece_definition_id
      t.integer :role_id
      t.integer :condition_id

      t.timestamps
    end
  end
end
