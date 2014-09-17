require 'garage.rb'
require 'bike.rb'
require 'bike_container_spec.rb'

describe Garage do

	it_behaves_like 'A bike container'

	let (:garage) 			{ Garage.new 			}
	let (:bike) 				{ Bike.new 				}
	let (:broken_bike) 	{ Bike.new.break!	}

	it 'should have a max capacity of 200 bikes' do
		expect(garage.capacity).to eq 200
	end

	it 'should have no bikes when created' do
		expect(garage).to be_empty
	end

	it 'should fix bikes as soon as they are docked' do
		garage.dock(broken_bike)
		garage.dock(bike)
		garage.fix_all_broken_bikes
		expect(broken_bike.broken?).to eq false
	end

end