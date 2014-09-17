require 'van.rb'
require 'bike_container_spec.rb'

describe Van do

	it_behaves_like 'A bike container'

	let (:van) { Van.new }
	let (:bike) { Bike.new }

	it "should have a max capacity of 40" do
		expect(van).to be_empty
		40.times { van.dock(bike) }
		expect(van).to be_full
	end

end