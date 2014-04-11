require 'spec_helper'

describe Game do
	it 'should show the users health' do
		game1 = FactoryGirl.create(:game)
		Game.all.should eq [game1]
	end

	it 'should start with no mana' do
		game1 = FactoryGirl.create(:game)
		Game.current_mana.should eq 1
	end


	describe 'user_hand' do
		describe 'set_user_hand' do
			it 'needs to be initialized with set_user_hand' do
				game = FactoryGirl.create(:game)
				minion1 = FactoryGirl.create(:minion)
				game.set_user_hand(minion1).should eq [minion1]
			end
		end

		describe 'add_minion_to_hand' do
			it 'adds minions to the hand' do
				game = FactoryGirl.create(:game)
				minion1 = FactoryGirl.create(:minion)
				minion2 = FactoryGirl.create(:defender_of_argus)
				game.set_user_hand(minion1)
				game.add_minion_to_hand(minion2)
				game.user_hand.should eq [minion1, minion2]
			end
		end

		describe 'remove_minion_from_hand' do
			it 'removess minions to the hand' do
				game = FactoryGirl.create(:game)
				minion1 = FactoryGirl.create(:minion)
				minion2 = FactoryGirl.create(:defender_of_argus)
				game.set_user_hand(minion1)
				game.add_minion_to_hand(minion2)
				game.remove_minion_from_hand(minion1)
				game.user_hand.should eq [minion2]
			end
		end
	end

	describe 'user_field' do
		it 'should contain all minions in the field' do
			game = FactoryGirl.create(:game)
			minion1 = FactoryGirl.create(:minion)
			game.set_user_field(minion1)
			game.user_field.should eq [minion1]
		end
	end

	describe 'add_minion_to_field' do
		it 'should add a minion to the field array' do
			game = FactoryGirl.create(:game)
			minion1 = FactoryGirl.create(:minion)
			minion2 = FactoryGirl.create(:defender_of_argus)
			game.set_user_field(minion1)
			game.add_minion_to_field(minion2)
			game.user_field.should eq [minion1, minion2]
		end
	end

	describe 'remove_minion_from_field' do
		it 'should remove a minion from the field array' do
			game = FactoryGirl.create(:game)
			minion1 = FactoryGirl.create(:minion)
			minion2 = FactoryGirl.create(:defender_of_argus)
			game.set_user_field(minion1)
			game.add_minion_to_field(minion2)
			game.remove_minion_from_field(minion1)
			game.user_field.should eq [minion2]
		end
	end

	describe 'total_field_damage' do
		it 'should return the total damage of all minions on the field.' do
			game = FactoryGirl.create(:game)
			minion1 = FactoryGirl.create(:minion)
			minion2 = FactoryGirl.create(:defender_of_argus)
			game.set_user_field(minion1)
			game.add_minion_to_field(minion2)
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
