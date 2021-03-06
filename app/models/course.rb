class Course < ActiveRecord::Base
	has_many :lessons
	has_many :subscriptions
	belongs_to :teacher, :class_name => "User"

	
	has_attached_file :illustration, styles: { head: "1600x550#", slice: "800x200#", medium: "800x400#", thumb: "300x100#" }, default_url: ":style/missing_illustration.png"
	validates_attachment_content_type :illustration, content_type: /\Aimage\/.*\Z/

	def to_param
	    "#{id} #{short_name}".parameterize
	end

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

	def minutes_left
		duration_in_minutes - (duration_in_hours*60)
	end

	def display_duration
		if duration_in_hours >= 1
			"#{duration_in_hours}h#{minutes_left}"
		else
			"#{duration_in_minutes} min"
		end
	end
	
end
