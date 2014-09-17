require 'docking_station.rb'

describe DockingStation do

	let (:station) { DockingStation.new(:capacity => 100) }

	it 'should allow a default capacity on initializing' do
		expect(station.capacity).to eq 100
	end
end






