# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Comment.create(comment: 'Germany', user_id: 4, tv_show_id: 1)
Comment.create(comment: 'japan', user_id: 3, tv_show_id: 2)
Comment.create(comment: 'swiss', user_id: 1, tv_show_id: 3)