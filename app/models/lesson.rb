class Lesson < ActiveRecord::Base
	belongs_to :course
	has_many :notes
	has_many :achievements, :as => :achievable



	def previous
	  Lesson.where(:course_id => self.course_id).where(["nr < ?", nr]).last
	end

	def next
	  Lesson.where(:course_id => self.course_id).where(["nr > ?", nr]).first
	end

	auto_html_for :video do
      html_escape
      image
      youtube(:width => 725, :height => 450, :autoplay => true)
      vimeo(:width => 725, :height => 450, :autoplay => true)
      link :target => "_blank", :rel => "nofollow"
      simple_format
    end

    def duration_in_minutes
    	(duration / 60).round
    end

    def seconds_left
		duration - (duration_in_minutes*60)
	end

	def display_duration
		if duration_in_minutes >= 1
			"#{duration_in_minutes}'#{seconds_left}''"
		else
			"#{duration_in_seconds}''"
		end
	end


end
