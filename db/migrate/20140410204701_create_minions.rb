class CreateMinions < ActiveRecord::Migration
  def change
    create_table :minions do |t|
    		t.string :name
    		t.text :description
    		t.integer :base_health
    		t.integer :base_attack
    		t.integer :ability_id
      t.timestamps
    end
  end
end
