class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :first_half
      t.string :latter_half
      t.string :author
      t.string :comment

      t.timestamps
    end
  end
end
