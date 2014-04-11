class Game < ActiveRecord::Base

	def set_user_hand(minion)
		@user_hand = []
		@user_hand << minion
	end

	def mana

	def set_user_field(minion)
		@user_field = []
		@user_field << minion
	end

	def user_field
		@user_field
	end

	def user_hand
		@user_hand
	end

	def add_minion_to_hand(minion)
		@user_hand << minion
	end

	def add_minion_to_field(minion)
		@user_field << minion
	end

	def remove_minion_from_hand(minion)
		@user_hand.delete(minion)
	end

	def remove_minion_from_field(minion)
		@user_field.delete(minion)
	end

	def total_field_damage
		@total_field_damage = 0
		@user_field.each do |minion|
			@total_field_damage = @total_field_damage + minion.base_attack
		end
		@total_field_damage
	end

	def lethal
		@total_user_damage = 1
		(self.opponent_health - @total_user_damage) <= 0
	end
end
