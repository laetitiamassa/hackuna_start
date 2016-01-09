class User < ActiveRecord::Base
	has_many :courses, :foreign_key => "teacher_id"
  has_many :achievements
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", mini: "50x50>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


    def full_name
    	"#{first_name} #{last_name}"
    end

  def has_achieved?(lesson)
    achievements.where(:achievable_type => "Lesson", :achievable_type => lesson.id)
  end
end
