class CreateCards < ActiveRecord::Migration
	create_table :cards do |t|
		t.string :card_id
		t.string :first_half
		t.string :latter_half
		t.string :author
		t.string :comment
		t.timestamps
	end
end
