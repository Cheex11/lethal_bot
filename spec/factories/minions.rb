# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :minion do
  	name 'bluegill_warrior'
  	description 'Murloc'
  	base_health 1
  	base_attack 2
  	ability_id 1

  	factory :defender_of_argus do
	  	name 'Defender of Argus'
	  	base_health 2
	  	base_attack 2
	  	ability_id 2
	  end

	  factory :azure_drake do
	  	name 'Azure Drake'
	  	base_attack 4
	  	base_health 4
	  	ability_id 3
	  end
	end
end
