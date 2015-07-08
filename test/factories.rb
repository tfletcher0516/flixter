FactoryGirl.define do

	factory :user do
		sequence :email do |n|
				"bob#{n}@bob.com"
		end
		password "password"
		password_confirmation "password"
	end


	factory :course do 
		user
		title  "Anything"
		cost 123
		description "Course description"
	end




end



