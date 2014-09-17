require 'bike_container.rb'

shared_examples 'A bike container' do

	class ContainerHolder; include BikeContainer; end

		describe BikeContainer do

			let (:bike) 	{ Bike.new }
			let (:holder) { ContainerHolder.new }

			def fill_holder
				(BikeContainer::DEFAULT_CAPACITY).times { holder.dock(bike) }
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

			it "should not accept a bike if it is full" do
				fill_holder
				expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
			end

			it "should know when it's empty" do
				expect(holder).to be_empty
			end

			it "should not release a bike if it is empty" do
				expect(holder).to be_empty
				expect(lambda { holder.release(bike) }).to raise_error(RuntimeError)
			end

			it "should provide a list of available bikes" do
				working_bike, broken_bike = Bike.new, Bike.new
				broken_bike.break!
				holder.dock(working_bike)
				holder.dock(broken_bike)
				expect(holder.available_bikes).to eq ([working_bike])
			end

			it "should provide a list of broken bikes" do
				working_bike, broken_bike = Bike.new, Bike.new
				broken_bike.break!
				holder.dock(working_bike)
				holder.dock(broken_bike)
				expect(holder.broken_bikes).to eq ([broken_bike])
			end

	end
end