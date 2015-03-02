class CreateWods < ActiveRecord::Migration
  def change
    create_table :wods do |t|
      t.text :workout
      t.integer :user_id
      t.timestamps
    end
  end
end
