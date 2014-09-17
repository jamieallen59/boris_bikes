require 'garage.rb'
require 'bike_container_spec.rb'

describe Garage do

	it_behaves_like 'A bike container'

	let (:garage) { Garage.new }

	it 'should have a max capacity of 200 bikes' do
		expect(garage.capacity).to eq 200
	end

	it 'should fix bikes as soon as they are docked' do
		broken_bike = double :bike, broken?: true
		garage.dock(broken_bike)
		expect(broken_bike).to receive(:fix!)
		garage.fix_all_broken_bikes
	end

end