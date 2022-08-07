class CreateRoleOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :role_orders do |t|
      t.integer :higher_role_id
      t.integer :lower_role_id

      t.timestamps
    end
  end
end
