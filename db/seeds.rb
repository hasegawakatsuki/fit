# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

checkups_csv = CSV.readlines("db/checkups.csv")
checkups_csv.shift
checkups_csv.each do |row|
  Checkup.create(hospital_id: row[1], name: row[2], detail: row[3], price: row[4], coupon: row[7],)
end