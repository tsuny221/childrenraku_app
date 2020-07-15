# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.last)

Admin.create!(
  email: 'test@admin.com',
  name: '管理者1',
  password: '123456',
)
Admin.create!(
  email: 'test2@admin.com',
  name: '管理者2',
  password: '123456',
)
Admin.create!(
  email: 'test3@admin.com',
  name: '管理者3',
  password: '123456',
)

Room.create!(
  name: 'room',
  key: 'room',
  admin_id: '1',
)
Room.create!(
  name: 'room2',
  key: 'room2',
  admin_id: '2',
)
Room.create!(
  name: 'room3',
  key: 'room3',
  admin_id: '3',
)

Family.create!(
  room_id: '1',
)
Family.create!(
  room_id: '1',
)
Family.create!(
  room_id: '1',
)
Family.create!(
  room_id: '2',
)
Family.create!(
  room_id: '2',
)
Family.create!(
  room_id: '3',
)

User.create!(
  email: 'test@user.com',
  password: '123456',
  last_name: '吉田',
  first_name: '朱音',
  last_name_kana: 'ヨシダ',
  first_name_kana:'アカネ',
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
  last_name: '吉田',
  first_name: '雄太',
  last_name_kana: 'ヨシダ',
  first_name_kana:'ユウタ',
  phone_number: '1111111',
  postcode: '1111111',
  address: 'テスト県テスト市テスト町',
  profile_image: '',
  family_id: '1',
  room_id: '1',
)

User.create!(
  email: 'test3@user.com',
  password: '123456',
  last_name: '沢田',
  first_name: '洋子',
  last_name_kana: 'サワダ',
  first_name_kana:'ヨウコ',
  phone_number: '1111111',
  postcode: '1111111',
  address: 'テスト県テスト市テスト町',
  profile_image: '',
  family_id: '2',
  room_id: '1',
)
User.create!(
  email: 'test4@user.com',
  password: '123456',
  last_name: '花澤',
  first_name: '沙知',
  last_name_kana: 'ハナザワ',
  first_name_kana:'サチ',
  phone_number: '1111111',
  postcode: '1111111',
  address: 'テスト県テスト市テスト町',
  profile_image: '',
  family_id: '3',
  room_id: '1',
)
User.create!(
  email: 'test5@user.com',
  password: '123456',
  last_name: '有栖川',
  first_name: '玲',
  last_name_kana: 'アリスガワ',
  first_name_kana:'レイ',
  phone_number: '1111111',
  postcode: '1111111',
  address: 'テスト県テスト市テスト町',
  profile_image: '',
  family_id: '4',
  room_id: '2',
)
User.create!(
  email: 'test6@user.com',
  password: '123456',
  last_name: '鳩貝',
  first_name: '悠美',
  last_name_kana: 'ハトガイ',
  first_name_kana:'ユウミ',
  phone_number: '1111111',
  postcode: '1111111',
  address: 'テスト県テスト市テスト町',
  profile_image: '',
  family_id: '5',
  room_id: '2',
)
User.create!(
  email: 'test7@user.com',
  password: '123456',
  last_name: '佐伯',
  first_name: '愛海',
  last_name_kana: 'サエキ',
  first_name_kana:'アミ',
  phone_number: '1111111',
  postcode: '1111111',
  address: 'テスト県テスト市テスト町',
  profile_image: '',
  family_id: '6',
  room_id: '3',
)
Child.create!(
  last_name: '吉田',
  first_name: '快斗',
  last_name_kana: 'ヨシダ',
  first_name_kana:'カイト',
  grade: 2,
  school_class: '2',
  gender: 1,
  allergy: 'なし',
  special_notes: 'なし',
  family_id: '1',
  user_id: '1'
)
Child.create!(
  last_name: '吉田',
  first_name: '晴人',
  last_name_kana: 'ヨシダ',
  first_name_kana:'ハルト',
  grade: 5,
  school_class: '4',
  gender: 1,
  allergy: 'なし',
  special_notes: 'なし',
  family_id: '1',
  user_id: '1'
)

Child.create!(
  last_name: '沢田',
  first_name: '那月',
  last_name_kana: 'サワダ',
  first_name_kana: 'ナツキ',
  grade: 4,
  school_class: '1',
  gender: 2,
  allergy: '花粉症',
  special_notes: 'なし',
  family_id: '2',
  user_id: '3'
)
Child.create!(
  last_name: '花澤',
  first_name: '香奈美',
  last_name_kana: 'ハナザワ',
  first_name_kana: 'カナミ',
  grade: 1,
  school_class: '1',
  gender: 2,
  allergy: 'なし',
  special_notes: 'なし',
  family_id: '3',
  user_id: '4'
)
Child.create!(
  last_name: '花澤',
  first_name: '康太',
  last_name_kana: 'ハナザワ',
  first_name_kana: 'コウタ',
  grade: 1,
  school_class: '1',
  gender: 1,
  allergy: 'なし',
  special_notes: 'なし',
  family_id: '3',
  user_id: '4'
)
Child.create!(
  last_name: '有栖川',
  first_name: '真美',
  last_name_kana: 'アリスガワ',
  first_name_kana: 'マミ',
  grade: 6,
  school_class: '1',
  gender: 2,
  allergy: 'なし',
  special_notes: 'なし',
  family_id: '4',
  user_id: '5'
)
Child.create!(
  last_name: '鳩貝',
  first_name: '愛梨',
  last_name_kana: 'ハトガイ',
  first_name_kana: 'アイリ',
  grade: 4,
  school_class: '5',
  gender: 2,
  allergy: 'なし',
  special_notes: 'なし',
  family_id: '5',
  user_id: '6'
)

Child.create!(
  last_name: '佐伯',
  first_name: '圭二',
  last_name_kana: 'サエキ',
  first_name_kana: 'ケイジ',
  grade: 3,
  school_class: '4',
  gender: 1,
  allergy: 'なし',
  special_notes: 'なし',
  family_id: '6',
  user_id: '7'
)
