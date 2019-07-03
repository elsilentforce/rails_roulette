class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :current_credits, default: 0
      t.timestamps null: false
    end
    add_index :users, :username, unique: true
  end
end
