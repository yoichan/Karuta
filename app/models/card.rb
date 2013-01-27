class Card < ActiveRecord::Base
  attr_accessible :author, :comment, :first_half, :latter_half, :card_id, :place
end
