require_relative 'bike_container.rb'
require 'bike.rb'

class Van

	include BikeContainer

	def initialize
		self.capacity = 40
	end

	def collect_broken_bikes_from(station)
		station.broken_bikes.each { |bike| release(bike) }
	# 	station.broken_bikes.each { |bike| dock(station.release(bike)) }
	end

	# def deposit_broken_bikes_at(garage)
	# 	broken_bikes.each { |bike| garage.dock(bike) }
	# end

end
