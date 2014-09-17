require 'van.rb'
require 'bike.rb'
require 'garage.rb'
require 'docking_station.rb'
require 'bike_container_spec.rb'

describe Van do

	it_behaves_like 'A bike container'

	let (:bikevan) 					{ Van.new 						}
	let (:bike)  						{ Bike.new 						}
	let (:broken_bike) 			{ Bike.new.break!			}
	let (:docking_station) 	{ DockingStation.new 	}
	let (:garage) 					{ Garage.new 					}


	it "should have a max capacity of 40" do
		(bikevan.capacity).times { bikevan.dock(bike) }
		
		expect(bikevan).to be_full
	end

	it 'should collect broken bikes from the docking station' do
		docking_station.dock(bike)
		docking_station.dock(broken_bike)
		bikevan.collect_broken_bikes_from(docking_station)

		expect(bikevan.bikes).to eq [broken_bike]
	end

	it 'should drop broken bikes off at the garage' do
		bikevan.dock(bike)
		bikevan.dock(broken_bike)
		bikevan.drop_broken_bikes_at(garage)

		expect(bikevan.bikes).to eq [bike]
		expect(garage.bikes).to eq [broken_bike]
	end

	it 'should collect fixed bikes from the garage' do
		garage.dock(bike)
		bikevan.collect_working_bikes_from(garage)

		expect(bikevan.bikes).to eq [bike]
	end

	it 'should drop fixed bikes off at the station' do
		bikevan.dock(bike)
		bikevan.drop_working_bikes_at(docking_station)

		expect(docking_station.bikes).to eq [bike]
	end

end
