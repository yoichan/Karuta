# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

JapanesePoem.delete_all
if Rails.env == 'production'
	JapanesePoem.connection.execute("select setval('japanese_poems_id_seq', 1, false)")
else
	JapanesePoem.connection.execute("alter table  AUTO_INCREMENT = 1")
end
CSV.foreach('db/japanese_poems.csv') do |row|
	JapanesePoem.create(:poem_no => row[0], :first_half => row[1], :last_half => row[2], :poet => row[3], :modern_translation => row[4], :related_place => row[5])
end
