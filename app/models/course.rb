class Course < ActiveRecord::Base
	has_many :lessons
	belongs_to :teacher, :class_name => "User"

	
	has_attached_file :illustration, styles: { head: "1600x400#", slice: "800x200#", medium: "400x100#", thumb: "300x75#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :illustration, content_type: /\Aimage\/.*\Z/
	
end
