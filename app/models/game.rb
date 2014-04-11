class Game < ActiveRecord::Base


	def set_user_hand(minion)
		@user_hand = []
		@user_hand << minion
	end

	def user_hand
		@user_hand
	end

	def add_minion_to_hand(minion)
		@user_hand << minion
	end

	def remove_minion_from_hand(minion)
		@user_hand.delete(minion)
	end

	def lethal
		@total_user_damage = 1
		(self.opponent_health - @total_user_damage) <= 0
	end

end
