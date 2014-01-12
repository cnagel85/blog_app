FactoryGirl.define do

  sequence :title do |n|
    "#{n}Lorem ipsum"
  end

  sequence :content do |n|
    "#{n}"
  end

  factory :user do
    name     "Corey Nagel"
    email    "Coreyelliotnagel@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
  factory :post do
    title
    content
    user
  end
end