class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.integer :user_id
      t.string :achievable_type
      t.integer :achievable_id

      t.timestamps null: false
    end
  end
end
