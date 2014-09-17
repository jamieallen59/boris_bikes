require_relative 'bike_container.rb'

class Van

	include BikeContainer

	def initialize
		self.capacity = 40
	end

	def collect_broken_bikes_from(station)
		station.broken_bikes.each { |bike| dock(station.release(bike)) }
	end

	def drop_broken_bikes_at(garage)
		broken_bikes.each { |bike| garage.dock(release(bike)) }
	end

	def collect_working_bikes_from(garage)
		garage.bikes.each { |bike| dock(garage.release(bike)) }
	end

	def drop_working_bikes_at(station)
		available_bikes.each { |bike| station.dock(release(bike)) }
	end

end
