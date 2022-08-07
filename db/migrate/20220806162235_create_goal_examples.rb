class CreateGoalExamples < ActiveRecord::Migration[6.1]
  def change
    create_table :goal_examples do |t|
      t.integer :tile_definition_id
      t.integer :goal_type

      t.timestamps
    end
  end
end
