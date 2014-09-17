require 'docking_station.rb'
require 'bike_container_spec.rb'

describe DockingStation do

	it_behaves_like 'A bike container'

	let (:station) { DockingStation.new(:capacity => 100) }

	it 'should allow a default capacity on initializing' do
		expect(station.capacity).to eq 100
	end
end






