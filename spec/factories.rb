FactoryGirl.define do

  factory :user do
    username 'dgalarza'
    email 'test@foo.com'
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
    user
    category
  end

end
