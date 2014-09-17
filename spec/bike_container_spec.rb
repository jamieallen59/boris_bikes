require 'bike_container.rb'

class ContainerHolder; include BikeContainer; end

	describe BikeContainer do

		let (:bike) { Bike.new }
		let (:holder) { ContainerHolder.new }

		def fill_holder
			20.times { holder.dock(bike) }
		end

		it "should hold a bike" do
			expect(holder.bike_count).to eq 0
			holder.dock(bike)
			expect(holder.bike_count).to eq 1
		end

		it "should release a bike" do
			holder.dock(bike)
			expect(holder.bike_count).to eq 1
			holder.release(bike)
			expect(holder.bike_count).to eq 0
		end

		it "should know when it's full" do
			expect(holder).not_to be_full
			fill_holder
			expect(holder).to be_full
		end

		it 'should not accept a bike if it is full' do
			fill_holder
			expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
		end

		it 'should provide a list of available bikes' do
			working_bike, broken_bike = Bike.new, Bike.new
			broken_bike.break!
			holder.dock(working_bike)
			holder.dock(broken_bike)
			expect(holder.available_bikes).to eq ([working_bike])
		end

end