class CreateGoalDefinitions < ActiveRecord::Migration[6.1]
  def change
    create_table :goal_definitions do |t|
      t.integer :role_id
      t.string :name
      t.integer :fu
      t.integer :point
      t.integer :condition_id

      t.timestamps
    end
  end
end
