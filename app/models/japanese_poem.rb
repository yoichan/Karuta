class JapanesePoem < ActiveRecord::Base
  attr_accessible :first_half, :last_half, :latitude, :longitude, :modern_translation, :poem_no, :poet, :related_place
	geocoded_by :related_place
	after_validation :geocode
	acts_as_gmappable :process_geocoding => false

	def match? (poem = nil)
		poem.id == self.id
	end

	def firsthalf_imagefile
		('hyakunin/e' << format("%03d", self.id) << '.jpg')
	end

	def lasthalf_imagefile
		('hyakunin-tori/tori-' << format("%03d", self.id) << '.png')
	end

	def self.select_random_poem(target_poems_id)
	  random_seed = rand(target_poems_id.length)	
		random_poem_id = target_poems_id[random_seed]
		self.find_by_id(random_poem_id)
	end



end

