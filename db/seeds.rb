# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TvShow.create(title: "Lego Master", network: "fox", rate: "G", time: "tuesday") 
TvShow.create(title: "Masked Singer", network: "fox", rate: "G", time: "thursday") 
TvShow.create(title: "Power", network: "starz", rate: "TVMA", time: "monday") 
TvShow.create(title: "Flea Market Flip", network: "HGTV", rate: "G", time: "tuesday") 
TvShow.create(title: "Money heist", network: "Netflix", rate: "TVMA", time: "Seasons") 