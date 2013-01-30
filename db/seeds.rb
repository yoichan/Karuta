# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

Card.delete_all
#Card.connection.execute("alter table cards AUTO_INCREMENT = 1")

CSV.foreach('db/hyakunin_ishu.csv') do |row|
	Card.create(:card_id => row[0], :first_half => row[1], :latter_half => row[2], :author => row[3], :comment => row[4], :place => row[5])
end
