class AddPlaceToCards < ActiveRecord::Migration
  def change
    add_column :cards, :place, :string, :after => :comment
  end
end
