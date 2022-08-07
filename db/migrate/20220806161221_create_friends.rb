class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.integer :request_user_id
      t.integer :target_user_id

      t.timestamps
    end
  end
end
