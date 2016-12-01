# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
    email:                    'test01@test.com',
    password:                 'test01',
    password_confirmation:    'test01',
    sign_in_count:            '0'
)
user = User.find_by_email('test01@test.com')

$i = 10
$num = 99
while $i < $num  do
  user.editors.create(
      filename:                 "editor#$i",
      hashpath:                 "1112#$i"
  )
  $i +=1
end
