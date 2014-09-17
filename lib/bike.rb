class Bike

	# attr_accessor :fix!

	def initialize
		fix!
	end

	def broken?
		@broken
	end

	def break!
		@broken = true
	end

	def fix!
		@broken = false
	end

end