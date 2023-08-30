# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  [
    {
      email: 'taro@example.com',
      last_name: '投票',
      first_name: '太郎',
      keyword: 'Management association 第3期',
      password: 'password',
    }, {
      email: 'jiro@example.com',
      last_name: '掲示',
      first_name: '次郎',
      keyword: 'Management association 第3期',
      password: 'password',
    }, {
      email: 'hanako@example.com',
      last_name: 'あん',
      first_name: '花子',
      keyword: 'Management association 第3期',
      password: 'password',
    }, {
      email: 'ai@example.com',
      last_name: 'けと',
      first_name: '愛',
      keyword: 'Management association 第3期',
      password: 'password',
    }, {
      email: 'ban@example.com',
      last_name: 'けいじ',
      first_name: 'ばん',
      keyword: 'Management association 第3期',
      password: 'password',
    }, {
      email: 'an@example.com',
      last_name: 'ばん',
      first_name: 'あん',
      keyword: 'Management association 第3期',
      password: 'password',
    }
  ]
)

Vote.create!(
  [
    {
      user_id: 2,
      title: '会議室が使用できなくなりました',
      question: '会議時間の変更をお願いします。参加可能な日時を選択してください。',
      choice_1: '9/2 10:00',
      choice_2: '9/2 15:00',
      choice_3: '9/3 10:00',
      choice_4: '9/3 15:00',
    },{
      user_id: 5,
      title: 'ハロウィンイベント',
      question: 'ハロウィンイベント用に子供たちにお菓子を用意したいと思います。予算をどのぐらいで設定しますか？',
      choice_1: '500円',
      choice_2: '400円',
      choice_3: '300円',
      choice_4: 'それ以下',
    }
  ]
)

VoteAnswer.create!(
  [
    {
      user_id: 1,
      vote_id: 1,
      answer: Vote.find(1).choice_1,
      email: User.find(1).email
    },{
      user_id: 2,
      vote_id: 1,
      answer: Vote.find(1).choice_1,
      email: User.find(2).email
    },{
      user_id: 1,
      vote_id: 2,
      answer: Vote.find(2).choice_1,
      email: User.find(1).email
    }
  ]
)

PublicRelation.create!(
  {
    user_id: 1,
    title: "8月度理事会議事録",
    date: Date.new(2023, 8, 31)
  }
)

Category.create!(
  [
    {
      name: "議題"
    },{
      name: "報告事項"
    },{
      name: "その他"
    }
  ]
)