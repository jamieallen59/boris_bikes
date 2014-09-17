require 'bike_container.rb'
require 'bike.rb'
require 'van.rb'

shared_examples 'A bike container' do

	class ContainerHolder; include BikeContainer; end

		describe BikeContainer do

			let (:bike) 				{ Bike.new 						}
			let (:holder) 			{ ContainerHolder.new }
			let (:van) 					{ Van.new 						}
			let (:broken_bike) 	{ Bike.new.break! 		}
			let (:broken_bike2) { Bike.new.break!			}

			def fill_holder(container)
				(container.capacity).times { holder.dock(bike) }
			end

			it 'has no bikes when created' do
				expect(holder.bike_count).to eq 0
			end

			it "can dock a bike" do
				expect(holder.bike_count).to eq 0
				holder.dock(bike)
				expect(holder.bike_count).to eq 1
			end

			it "can release a bike" do
				holder.dock(bike)
				expect(holder.bike_count).to eq 1
				holder.release(bike)
				expect(holder.bike_count).to eq 0
			end

			it "should know when it's full" do
				fill_holder(holder)
				expect(holder).to be_full
			end

			it "should not accept a bike if it is full" do
				fill_holder(holder)
				expect{ holder.dock(bike) }.to raise_error(RuntimeError)
			end

			it "should know when it's empty" do
				expect(holder).to be_empty
			end

			it "should not release a bike if it is empty" do
				expect(holder).to be_empty
				expect{ holder.release(bike) }.to raise_error(RuntimeError)
			end

			it "should provide a list of available bikes" do
				holder.dock(bike)
				holder.dock(broken_bike)
				expect(holder.available_bikes).to eq ([bike])
			end

			it "should provide a list of broken bikes" do
				holder.dock(bike)
				holder.dock(broken_bike)
				expect(holder.broken_bikes).to eq ([broken_bike])
			end

	end
end