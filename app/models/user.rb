class User < ActiveRecord::Base
	has_many :courses, :foreign_key => "teacher_id"
  has_many :achievements
  has_many :subscriptions, :foreign_key => "subscriber_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
	has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#", mini: "50x50#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


    def full_name
    	"#{first_name} #{last_name}"
    end

  def has_achieved?(lesson)
    achievements.where(:achievable_type => "Lesson", :achievable_id=> lesson.id).any?
  end

  def achieved_lessons_count(course)
    achieved_lessons_count = 0
    course.lessons.each do |lesson|
      if has_achieved?(lesson)
        achieved_lessons_count += 1
      end
    end
    achieved_lessons_count
  end

  def progress(course)
      achieved_lessons_count(course) * 100 / course.lessons.count
  end

  def has_completed?(course)
      achieved_lessons_count(course) == course.lessons.count
  end

  def is_student?(course)
    self.subscriptions.where(:course_id => course.id).any?
  end

  def is_admin
    email == "lol1@lol.com"
  end
end
