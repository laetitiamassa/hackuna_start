class Course < ActiveRecord::Base
	has_many :lessons
	has_many :subscriptions
	belongs_to :teacher, :class_name => "User"

	
	has_attached_file :illustration, styles: { head: "1600x550#", slice: "800x200#", medium: "800x400#", thumb: "300x100#" }, default_url: ":style/missing_illustration.png"
	validates_attachment_content_type :illustration, content_type: /\Aimage\/.*\Z/

	def duration
		duration = 0
		self.lessons.each do |lesson|
			if lesson.duration
				duration += lesson.duration
			end
		end
		duration
	end

	def duration_in_minutes
		duration / 60
	end

	def duration_in_hours
		duration / 1.hour
	end
	
end
