FactoryGirl.define do
  factory :project do
    name "Project title"
    description  "Project summary and descrip"
    user_id 1
    # test has to reset current id
  end
end