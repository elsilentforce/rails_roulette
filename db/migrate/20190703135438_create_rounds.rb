class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :winner, null: false
      t.timestamps null: false
    end
  end
end
