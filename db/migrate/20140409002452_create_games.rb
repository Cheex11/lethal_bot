class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.column :user_health, :integer
    	t.column :opponent_health, :integer
    	t.column :user_hero, :string
    	t.column :opponent_hero, :string
      t.timestamps
    end
  end
end
