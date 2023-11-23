# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

UserRole.create(role_name: "ADMIN")
UserRole.create(role_name: "SISTEMA")
Authentication.create(username: "teste1", password: "11111", user_role_id: 1)
