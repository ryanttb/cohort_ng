FactoryGirl.define do
  factory :user do
    name "Ryan Westphal"
    email "rwestphal@cyber.law.harvard.edu"
    password "foobar"
    password_confirmation "foobar"
  end
end
