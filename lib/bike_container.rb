module BikeContainer

	DEFAULT_CAPACITY = 20

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		raise "This station is full" if full?
		raise "You can only dock bikes here" unless bike.is_a? Bike
		bikes << bike
	end

	def release(bike)
		raise "There are no bikes available" if empty?
		raise "We can only release actual bikes" unless bike.is_a? Bike
		bikes.delete(bike)
	end

	def empty?
		bike_count == 0
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.reject { |bike| bike.broken? }
	end

	def broken_bikes
		bikes - available_bikes
	end

end
