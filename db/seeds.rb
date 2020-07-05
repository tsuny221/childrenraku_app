# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'test@admin.com',
  name: '管理者1',
  password: '123456',
)

Room.create!(
  name: 'room',
  key: 'room',
  admin_id: '1',
)

User.create!(
  email: 'test@user.com',
  password: '123456',
  first_name: '手巣都',
  last_name: '出寸',
  first_name_kana: 'テスト',
  last_name_kana:'デス',
  phone_number: '1111111',
  postcode: '1111111',
  address: 'テスト県テスト市テスト町',
  profile_image: '',
  family_id: '1',
  room_id: '1',
)

User.create!(
  email: 'test2@user.com',
  password: '123456',
  first_name: '手巣都2',
  last_name: '出寸2',
  first_name_kana: 'テスト2',
  last_name_kana:'デス2',
  phone_number: '1111111',
  postcode: '1111111',
  address: 'テスト県テスト市テスト町',
  profile_image: '',
  family_id: '2',
  room_id: '1',
)
