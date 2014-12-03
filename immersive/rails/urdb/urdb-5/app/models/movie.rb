class Movie < ActiveRecord::Base
	has_many :showtimes
	has_many :roles
	has_many :stars, through: :roles

	validates :title, :poster_url, presence: true

	def rotten_finder
    RottenMovie.find(title: title, limit: 1)
  end
  
  def snippet
    description.truncate 50
  end
end