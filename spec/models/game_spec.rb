require 'spec_helper'

describe Game do
	it 'should show the users health' do
		game1 = FactoryGirl.create(:game)
		Game.all.should eq [game1]
	end
end
