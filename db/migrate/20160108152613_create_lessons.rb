class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :description
      t.integer :nr
      t.string :video
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
