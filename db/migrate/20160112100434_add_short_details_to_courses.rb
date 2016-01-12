class AddShortDetailsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :short_name, :string
    add_column :courses, :short_description, :string
  end
end
