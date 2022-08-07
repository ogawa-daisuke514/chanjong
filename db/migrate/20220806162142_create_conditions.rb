class CreateConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :conditions do |t|
      t.integer :arg
      t.integer :condition_id
      t.integer :process_type_id

      t.timestamps
    end
  end
end
