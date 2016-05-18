# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

# checkups_csv = CSV.readlines("db/checkups.csv")
# checkups_csv.shift
# checkups_csv.each do |row|
#   Checkup.create(hospital_id: row[1], name: row[2], detail: row[3], price: row[4], coupon: row[7],)

# companies_csv = CSV.readlines("db/companies.csv")
# companies_csv.shift
# companies_csv.each do |row|
#   Company.create(name: row[1], homepage: row[2], access: row[5], logo_url: row[6], entrance_fee: row[7], detail: row[8])

# fitnesses_csv = CSV.readlines("db/fitnesses.csv")
# fitnesses_csv.shift
# fitnesses_csv.each do |row|
#   Fitness.create(company_id: row[1], name: row[2], detail: row[3], price: row[4], place: row[5], image_url: row[8], coupon: row[9])

# health_statuses_csv = CSV.readlines("db/health_statuses.csv")
# health_statuses_csv.shift
# health_statuses_csv.each do |row|
#   HealthStatus.create(user_id: row[1], medical_history: row[2], illness: row[3], weight: row[4], height: row[5], blood_pressure: row[6], fat_percentage: row[7])

# hospitals_csv = CSV.readlines("db/hospitals.csv")
# hospitals_csv.shift
# hospitals_csv.each do |row|
#   Hospital.create(name: row[1], place: row[2], detail: row[3], homepage: row[4], image: row[5], tel: row[8], access: row[9])


# insurances_csv = CSV.readlines("db/insurances.csv")
# insurances_csv.shift
# insurances_csv.each do |row|
#   Insurance.create(user_id: row[1], fee: row[2])

# steps_csv = CSV.readlines("db/steps.csv")
# steps_csv.shift
# steps_csv.each do |row|
#   Step.create(user_id: row[1], step_num: row[2], training: row[3])


users_csv = CSV.readlines("db/users.csv")
users_csv.shift
users_csv.each do |row|
  User.create(email: row[1], encrypted_password: row[2], reset_password_token: row[3],reset_password_sent_at: row[4], remember_created_at: row[4], sign_in_count: row[5],current_sign_in_at: row[6], last_sign_in_at: row[7],current_sign_in_ip: row[8],last_sign_in_ip: row[9], name: row[12], sex: row[13],birth_date: row[14],customer_id: row[15])
end