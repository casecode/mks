class Alumni < ActiveRecord::Base

	def full_name
		"#{self.first_name.capitalize} #{self.last_name.capitalize}"
	end
end
