class DockingStation

	DEFAULT_CAPACITY = 20

	def initialize( options = {} )
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def dock(bike)
		raise 'Docking station is full' if full?
		@bikes << bike
	end

	def bike_count
		@bikes.count
	end

	def release(bike)
		@bikes.delete(bike)
	end

	def full?
		bike_count == @capacity
	end

	def available_bikes
		@bikes.reject { |bike| bike.broken? }
	end

end