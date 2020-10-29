# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

miumiu = Cat.create!(birth_date: "2018/03/10", color: "white", name: "miumiu", sex: "M", description: "Michelle's cat, hahaha")
neko = Cat.create!(birth_date: "2005/01/07", color: "red", name: "Neko", sex: "F", description: "a neko of all nekos")
