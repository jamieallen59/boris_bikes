require_relative 'bike_container.rb'

class DockingStation

	include BikeContainer

	def initialize( options = {} )
		self.capacity = options.fetch(:capacity, capacity)
	end

end