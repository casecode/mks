class Movie < ActiveRecord::Base
	has_many :showtimes
	has_many :roles
	has_many :stars, through: :roles

	validates :title, presence: true

	def rotten_finder
    RottenMovie.find(title: title, limit: 1)
  end

  def audience_rating
  	rotten_finder.ratings.audience_score unless rotten_finder.empty?
  end

  def self.average_rating
  	# Get all the movie scores and store them in an array
  	scores = self.all.collect do |movie|
  		movie.audience_rating
  	end

  	# Add all the movie scores in the array together
  	scores.compact!

  	# Divide by the number of movies
  	if scores.length > 0
  		scores.sum / scores.length
  	else
  		nil
  	end
  end
  
  def snippet
    description.to_s.truncate 50
  end
end
