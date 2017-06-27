# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[User, Sub].map(&:destroy_all)

User.create(username: 'bob', password: '123456')
User.create(username: 'Vegeta', password: '123456')
User.create(username: 'Goku', password: '123456')

Sub.create(title: 'NBA', description: 'Basketball', mod_id: User.first.id)
Sub.create(title: 'Dragon Balls', description: 'Where to find them?', mod_id: User.third.id)
Sub.create(title: 'App Academy', description: 'Buuuuugs, buuuuuugs', mod_id: User.second.id)
