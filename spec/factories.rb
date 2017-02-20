FactoryGirl.define do
	factory :user do
		sequence :email do |n|
			"dummyemail#{n}@gmail.com"
		end
		password "secretPassword"
		password_confirmation "secretPassword"
	end
end
