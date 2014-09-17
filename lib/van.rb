require_relative 'bike_container.rb'

class Van

	include BikeContainer

	def initialize
		self.capacity = 40
	end

end
