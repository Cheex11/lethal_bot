# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
  	user_health 30
  	opponent_health 30
  	user_hero 'Rogue'
  	opponent_hero 'Warrior'
  end

  factory :game_opponent_one_health do
  	opponent_health 1
end
