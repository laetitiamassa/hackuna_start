class AddAttachmentIllustrationToCourses < ActiveRecord::Migration
  def self.up
    change_table :courses do |t|
      t.attachment :illustration
    end
  end

  def self.down
    remove_attachment :courses, :illustration
  end
end
