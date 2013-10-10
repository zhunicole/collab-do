FactoryGirl.define do
  factory :project do
    name "Project title"
    description  "Project summary and descrip"
    creator_id 1
    location 'singapore'
		avatar 'someavatarstring'
		start_time "Thu, 10 Oct 2020 12:02:53 +0800"
		end_time "Sat, 12 Oct 2020 12:02:53 +0800"
		ongoing true
	end
end