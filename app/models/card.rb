class Card < ActiveRecord::Base
  attr_accessible :author, :comment, :first_half, :latter_half, :card_id, :place
	geocoded_by :place
	after_validation :geocode
	acts_as_gmappable :process_geocoding => false
end
