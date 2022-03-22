require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# =========== add one record like this ===========
# student = Student.create(first_name: "john", last_name: "doe", email: "john@example.com", address: "MG road")

# ============ also can add like =============
# student = Student.new(first_name: "mk", last_name: "shaikh", email: "nk@example.com", address: "06, sk road")
# student.save

# ===========Add multiple Records like========== 
# student = Student.create([
#     { 
#         first_name: 'avi',
#         last_name: 'shrma',
#         email: 'avi@gmail.com',
#         address: 'avika nagar, bhopal'
#     },
#     { 
#         first_name: 'bishit',
#         last_name: 'rails',
#         email: 'bs@gmail.com',
#         address: 'karnataka'
#     }
# ])

# ============== Add Multiple Records using times iterator ===========
# 10.times do |i|
#     Student.create(
#         first_name: "Student #{i+1}",
#         last_name: "surname #{i+1}",
#         email: "stu#{i+1}@gmail.com",
#         address: "student address #{i+1}"
#     )
# end

# ================= Add Dumy Data using Faker Gems ============
# 10.times do
#     Student.create(
#         first_name: Faker::Name.unique.name,
#         email: Faker::Internet.email,
#         address: Faker::Address.street_address
#     )
# end

# 20.times do
#     Student.create(
#         first_name: Faker::Name.first_name,
#         last_name: Faker::Name.last_name,
#         email: Faker::Internet.email,
#         date_of_birth: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
#         local_address: Faker::Address.full_address, 
#         permanent_address: Faker::Address.street_address,
#         permanent_contact_number: Faker::PhoneNumber.phone_number,
#         alternate_contact_number: Faker::PhoneNumber.phone_number,
#     )
# end

# lets add dumy data in blogs which belongs to a student
# Student.all.each do |s|
#     s.blogs.create(title: "Dummy Blog for student #{s.id}", content: "custom content pending ")
#     s.blogs.create(title: "Dummy Blog for student #{s.id}", content: "custom content pending ")
# end

# dumy data in courses 
Course.create(name: "Angular Js", description: "js framework or library")