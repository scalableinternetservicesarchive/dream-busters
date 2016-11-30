# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Editor.create(
    filename:                 'editor01',
    hashpath:                 '111111',
    created_at:               '2016-11-06 01:08:46.995656',
    updated_at:               '2016-11-06 01:09:46.995656'
)

$i = 0
$num = 20000
while $i < $num  do
  editor_id = Editor.find_by_hashpath('111111').id
  Editor.find(editor_id).messages.create(
      editor_id:                 editor_id,
      speaker:                   'speaker1',
      content:                   "message #$i",
  )
  $i +=1
end

Editor.create(
    filename:                 'editor02',
    hashpath:                 '111112',
    created_at:               '2016-11-07 01:08:46.995656',
    updated_at:               '2016-11-07 01:09:46.995656'
)

$i = 0
$num = 20000
while $i < $num  do
  editor_id = Editor.find_by_hashpath('111112').id
  Editor.find(editor_id).messages.create(
      editor_id:                 editor_id,
      speaker:                   'speaker2',
      content:                   "message #$i"
  )
  $i +=1
end

Editor.create(
    filename:                 'editor03',
    hashpath:                 '111113',
    created_at:               '2016-11-08 01:08:46.995656',
    updated_at:               '2016-11-08 01:09:46.995656'
)

$i = 0
$num = 20000
while $i < $num  do
  editor_id = Editor.find_by_hashpath('111113').id
  Editor.find(editor_id).messages.create(
      editor_id:                 editor_id,
      speaker:                   'speaker3',
      content:                   "message #$i"
  )
  $i +=1
end

Editor.create(
    filename:                 'editor04',
    hashpath:                 '111114',
    created_at:               '2016-11-09 01:08:46.995656',
    updated_at:               '2016-11-09 01:09:46.995656'
)

$i = 0
$num = 20000
while $i < $num  do
  editor_id = Editor.find_by_hashpath('111114').id
  Editor.find(editor_id).messages.create(
      editor_id:                 editor_id,
      speaker:                   'speaker4',
      content:                   "message #$i"
  )
  $i +=1
end

Editor.create(
    filename:                 'editor05',
    hashpath:                 '111115',
    created_at:               '2016-11-10 01:08:46.995656',
    updated_at:               '2016-11-10 01:09:46.995656'
)

$i = 0
$num = 20000
while $i < $num  do
  editor_id = Editor.find_by_hashpath('111115').id
  Editor.find(editor_id).messages.create(
      editor_id:                 editor_id,
      speaker:                   'speaker5',
      content:                   "message #$i"
  )
  $i +=1
end

Editor.create(
    filename:                 'editor06',
    hashpath:                 '111116',
    created_at:               '2016-11-11 01:08:46.995656',
    updated_at:               '2016-11-11 01:09:46.995656'
)

$i = 0
$num = 20000
while $i < $num  do
  editor_id = Editor.find_by_hashpath('111116').id
  Editor.find(editor_id).messages.create(
      editor_id:                 editor_id,
      speaker:                   'speaker6',
      content:                   "message #$i"
  )
  $i +=1
end

Editor.create(
    filename:                 'editor07',
    hashpath:                 '111117',
    created_at:               '2016-11-12 01:08:46.995656',
    updated_at:               '2016-11-12 01:09:46.995656'
)

$i = 0
$num = 20000
while $i < $num  do
  editor_id = Editor.find_by_hashpath('111117').id
  Editor.find(editor_id).messages.create(
      editor_id:                 editor_id,
      speaker:                   'speaker7',
      content:                   "message #$i"
  )
  $i +=1
end

Editor.create(
    filename:                 'editor08',
    hashpath:                 '111118',
    created_at:               '2016-11-13 01:08:46.995656',
    updated_at:               '2016-11-13 01:09:46.995656'
)

$i = 0
$num = 20000
while $i < $num  do
  editor_id = Editor.find_by_hashpath('111118').id
  Editor.find(editor_id).messages.create(
      editor_id:                 editor_id,
      speaker:                   'speaker8',
      content:                   "message #$i"
  )
  $i +=1
end

Editor.create(
    filename:                 'editor09',
    hashpath:                 '111119',
    created_at:               '2016-11-14 01:08:46.995656',
    updated_at:               '2016-11-14 01:09:46.995656'
)

$i = 0
$num = 20000
while $i < $num  do
  editor_id = Editor.find_by_hashpath('111119').id
  Editor.find(editor_id).messages.create(
      editor_id:                 editor_id,
      speaker:                   'speaker9',
      content:                   "message #$i"
  )
  $i +=1
end

Editor.create(
    filename:                 'editor10',
    hashpath:                 '111120',
    created_at:               '2016-11-15 01:08:46.995656',
    updated_at:               '2016-11-15 01:09:46.995656'
)

$i = 0
$num = 20000
while $i < $num  do
  editor_id = Editor.find_by_hashpath('111120').id
  Editor.find(editor_id).messages.create(
      editor_id:                 editor_id,
      speaker:                   'speaker10',
      content:                   "message #$i"
  )
  $i +=1
end


User.create(
    email:                    'test01@test.com',
    password:                 'test01',
    password_confirmation:    'test01',
    sign_in_count:            '0',
    created_at:               '2016-11-15 01:08:46.995656',
    updated_at:               '2016-11-15 01:09:46.995656'
)

User.create(
    email:                    'test02@test.com',
    password:                 'test02',
    password_confirmation:    'test02',
    sign_in_count:            '0',
    created_at:               '2016-11-16 01:08:46.995656',
    updated_at:               '2016-11-16 01:09:46.995656'
)

User.create(
    email:                    'test03@test.com',
    password:                 'test03',
    password_confirmation:    'test03',
    sign_in_count:            '0',
    created_at:               '2016-11-12 01:08:46.995656',
    updated_at:               '2016-11-12 01:09:46.995656'
)

User.create(
    email:                    'test04@test.com',
    password:                 'test04',
    password_confirmation:    'test04',
    sign_in_count:            '0',
    created_at:               '2016-11-15 01:08:46.995656',
    updated_at:               '2016-11-15 01:09:46.995656'
)

User.create(
    email:                    'test05@test.com',
    password:                 'test05',
    password_confirmation:    'test05',
    sign_in_count:            '0',
    created_at:               '2016-11-16 01:08:46.995656',
    updated_at:               '2016-11-16 01:09:46.995656'
)

