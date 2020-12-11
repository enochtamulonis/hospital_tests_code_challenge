# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Patient.create(
  name: "Dante R. Murphey",
  email: "DanteRMurphey@armyspy.com",
  blood_group: "A+",
  dob: "06/13/47",
  test_date: "09/12/20",
  result: "Positive",
  inference_from_test: "Patient tested positive and was put in quarantine",
  staff_that_took_test: "Alison Watts"
)
