class Game < ActiveRecord::Base

	def start
		@user_hand = []
		@user_field = []
		@opponent_field = []
		@mana = 0
		@total_field_damage = 0
		@total_user_damage
		@total_hand_damage
		@turn = 0
	end

	def mana
		@mana
	end

	def turn
		@turn = @mana
	end

	def user_hand
		@user_hand
	end

	def user_field
		@user_field
	end

	def opponent_field
		@opponent_field
	end

	def mana
		@mana
	end

	def total_field_damage
		@user_field.each do |minion|
			@total_field_damage = @total_field_damage + minion.base_attack
		end
		@total_field_damage
	end

	def total_user_damage
		@total_user_damage
	end

	def total_hand_damage
		@toatl_hand_damage
	end

	def lethal
		@total_user_damage = 1
		(self.opponent_health - @total_user_damage) <= 0
	end
end
