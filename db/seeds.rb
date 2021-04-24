# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin1 = User.create(name: 'Admin1', isAdmin: true)
admin2 = User.create(name: 'Admin2', isAdmin: true)
agent1 = User.create(name: 'Agent1', isAdmin: false)
agent2 = User.create(name: 'Agent2', isAdmin: false)
