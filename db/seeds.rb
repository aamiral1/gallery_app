# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.where(email: 'test1@gmail.com').first_or_create(password: 'test123', password_confirmation: 'test123')
User.where(email: 'test2@gmail.com').first_or_create(password: 'test123', password_confirmation: 'test123')
User.where(email: 'test3@gmail.com').first_or_create(password: 'test123', password_confirmation: 'test123')