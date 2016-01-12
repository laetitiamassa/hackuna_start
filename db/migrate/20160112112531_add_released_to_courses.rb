class AddReleasedToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :is_released, :boolean
  end
end
