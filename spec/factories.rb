FactoryGirl.define do
  factory :user do
    name "Ryan Westphal"
    email "rwestphal@cyber.law.harvard.edu"
    password "foobar"
    password_confirmation "foobar"
    confirmed_at Date.parse( "1/1/2013" )
  end
end
