class AddDetailsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :target, :text
    add_column :courses, :prerequis, :text
    add_column :courses, :outcome, :text
  end
end
