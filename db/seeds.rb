# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

SYMPTOMS = [
  "Coughing",
  "Shortness of breath",
  "Chest tightness",
  "Abdominal pain",
  "Diarrhoea",
  "Constipation"
]

SYMPTOMS.each do |symptom_name|
  Symptom.find_or_create_by!(name: symptom_name)
end

all_symptoms = Symptom.all
user = User.first!
date_range = 1.month.ago.to_date..Date.today
scattered_dates = date_range.reject { |_date| rand < 0.45 }

Entry.destroy_all

scattered_dates.each do |date|
  symptom = all_symptoms.sample
  Entry.create(user: user, occurred_at: date, body: Faker::Lorem.paragraph,
    symptoms: [symptom])
end
