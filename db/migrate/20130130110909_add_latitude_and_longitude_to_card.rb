class AddLatitudeAndLongitudeToCard < ActiveRecord::Migration
  def change
    add_column :cards, :latitude, :float, :after => :place
    add_column :cards, :longitude, :float, :after => :latitude
  end
end
