require 'spec_helper'

describe Game do
	it 'should show the users health' do
		game1 = FactoryGirl.create(:game)
		Game.all.should eq [game1]
	end

	it 'should start with no mana' do
		game1 = FactoryGirl.create(:game)
		game1.start
		game1.mana.should eq 0
	end

	describe 'user_hand' do
		it 'should hold all the minions in the players hand and start with no minions' do
			game = FactoryGirl.create(:game)
			minion1 = FactoryGirl.create(:minion)
			game.start
			game.user_hand.should eq []
		end

		it 'should be able to hold minions' do
			game = FactoryGirl.create(:game)
			minion1 = FactoryGirl.create(:minion)
			game.start
			game.user_hand << minion1
			game.user_hand.should eq [minion1]
		end

		it 'should be able to have minions removed from it' do
			game = FactoryGirl.create(:game)
			minion1 = FactoryGirl.create(:minion)
			minion2 = FactoryGirl.create(:defender_of_argus)
			game.start
			game.user_hand << minion1
			game.user_hand << minion2
			game.user_hand.delete(minion1)
			game.user_hand.should eq [minion2]
		end
	end

	describe 'user_field' do
		it 'should hold all the minions the user puts on the field but start with no minions' do
			game =FactoryGirl.create(:game)
			minion1 = FactoryGirl.create(:minion)
			game.start
			game.user_field.should eq []
		end

		it 'should hold all the minions the user puts on the field' do
			game =FactoryGirl.create(:game)
			minion1 = FactoryGirl.create(:minion)
			game.start
			game.user_field << minion1
			game.user_field.should eq [minion1]
		end

		it 'should be able to have minions removed from it' do
			game =FactoryGirl.create(:game)
			minion1 = FactoryGirl.create(:minion)
			minion2 = FactoryGirl.create(:defender_of_argus)
			game.start
			game.user_field << minion1
			game.user_field << minion2
			game.user_field.delete(minion1)
			game.user_field.should eq [minion2]
		end
	end

	describe 'total_field_damage' do
		it 'should start with zero' do
			game = FactoryGirl.create(:game)
			game.start
			game.total_field_damage.should eq 0
		end

		it 'should calculate the total amount of damage all the minions on the field can produce' do
			game = FactoryGirl.create(:game)
			minion = FactoryGirl.create(:minion)
			minion1 = FactoryGirl.create(:defender_of_argus)
			game.start
			game.user_field << minion
			game.user_field << minion1
			game.total_field_damage.should eq 4
		end
	end

	describe 'lethal' do
		it 'should return false if the  user cannot decrease the opponents health to zero' do
			game1 = FactoryGirl.create(:game)
			game1.lethal.should eq false
		end

		it 'should return false if the  user cannot decrease the opponents health to zero' do
			game_w = FactoryGirl.create(:game_opponent_one_health)
			game_w.lethal.should eq true
		end
	end
end
