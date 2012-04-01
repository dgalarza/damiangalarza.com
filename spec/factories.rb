FactoryGirl.define do

  sequence :email do |n|
    "user-#{n}@foo.com"
  end

  factory :user do
    username 'dgalarza'
    email
    password 'mypassword'
    password_confirmation 'mypassword'
    admin true
  end

  factory :category do
    name 'JavaScript'
  end

  factory :post do
    title 'My Post'
    slug 'my-post'
    content 'lorem ipsum'
    published true
    user
    category
  end

end
