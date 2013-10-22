FactoryGirl.define do
  factory :admin, parent: :user do
  	first_name 'admin'
  	last_name 'boss'
  	location 'Singapore'
  	email "admin@domain.com"
    password  "12345678"
    password_confirmation  "12345678"
    admin true
    featured false
  end
end
