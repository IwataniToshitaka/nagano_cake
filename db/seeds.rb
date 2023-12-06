# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  #このAdminはモデル。User.find(params[:id])のような場面で使うUserモデルと似ている
  #create!の引数にはadminテーブルに作ったカラムを指定し、保存したい値を記述する
  email: iwatani@gmail
  password: zxcv
)