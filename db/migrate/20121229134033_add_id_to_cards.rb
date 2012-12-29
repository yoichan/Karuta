class AddIdToCards < ActiveRecord::Migration
  def change
    add_column :cards, :card_id, :string, :after => :id
  end
end
