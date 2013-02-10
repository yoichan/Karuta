class CreateJapanesePoems < ActiveRecord::Migration
  def change
    create_table :japanese_poems do |t|
      t.string :poem_no
      t.string :first_half
      t.string :last_half
      t.string :poet
      t.string :modern_translation
      t.string :related_place
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
