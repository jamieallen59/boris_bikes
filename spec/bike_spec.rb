require 'bike.rb'

describe Bike do

	it 'should not be broken after we create it' do
		bike = Bike.new
		
		expect(bike).not_to be_broken
	end


end