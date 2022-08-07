class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.integer :user_id
      t.string :name
      t.string :kana
      t.integer :faan
      t.integer :score_down_type
      t.string :outline
      t.string :comment
      t.integer :goal_definition_id
      t.integer :condition_id
      t.integer :goal_example_id

      t.timestamps
    end
  end
end
