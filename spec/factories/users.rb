FactoryGirl.define do

  factory :user do
    email                   "aaa@hoge.com"
    nickname                "hayashi"
    password                "11111111"
    password_confirmation   "11111111"
    member                  "div"
    profile                 "こんにちは！"
    works                   "student"
  end

end