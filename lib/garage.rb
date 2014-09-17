require_relative 'bike_container.rb'
require 'bike.rb'

class Garage

	include BikeContainer

	def initialize
		self.capacity = 200
	end

	def fix_all_broken_bikes
		bikes.each { |bike| bike.fix! }
	end


end