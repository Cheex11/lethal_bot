require 'spec_helper'

describe Minion do
	it 'should initialize with a set amount of health' do
		minion1 = FactoryGirl.create(:minion)
		minion1.base_health.should eq 1
	end

	it 'should initialize with a set amount of attack' do
		minion2 = FactoryGirl.create(:defender_of_argus)
		minion2.base_health.should eq 2
	end

	it 'should initialize with an ability ID' do
		minion = FactoryGirl.create(:azure_drake)
		minion.ability_id.should eq 3
	end
end
