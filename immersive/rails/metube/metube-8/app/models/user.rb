class User < ActiveRecord::Base
	has_many :videos

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
