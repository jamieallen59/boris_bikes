require 'bike.rb'

describe Bike do

	let (:bike) 				{ Bike.new 				}
	let (:broken_bike) 	{ Bike.new.break! }

	it 'should not be broken after we create it' do
		expect(bike).not_to be_broken
	end

	it 'should be able to break' do
		expect(broken_bike).to be_broken
	end

	it 'should be able to be fixed' do
		broken_bike.fix!
		expect(broken_bike).not_to be_broken
	end

end