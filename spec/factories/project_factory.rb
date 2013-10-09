FactoryGirl.define do
  factory :project do
    name "Project title"
    description  "Project summary and descrip"
    user_id 1
    location 'singapore'
		avatar 'someavatarstring'
		start_time DateTime.now
		end_time DateTime.now
	end
end