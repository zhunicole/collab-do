# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	first_name 'nicole'
  	last_name 'zhu'
  	location 'Singapore'
  	email "usernames@domain.com"
    password  "12345678"
    password_confirmation  "12345678"
    admin false
    featured false
    approved true
  end
end
