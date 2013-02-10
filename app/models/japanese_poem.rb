class JapanesePoem < ActiveRecord::Base
  attr_accessible :first_half, :last_half, :latitude, :longitude, :modern_translation, :poem_no, :poet, :related_place
	geocoded_by :related_place
	after_validation :geocode
	acts_as_gmappable :process_geocoding => false
end

