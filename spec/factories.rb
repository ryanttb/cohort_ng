FactoryGirl.define do
  factory :user do
    name "Ryan Westphal"
    email "rwestphal@cyber.law.harvard.edu"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :contact do
    first_name "Bob"
    last_name "Dole"
  end

  factory :role do
    first_name "Bob"
    last_name "Dole"
  end
end
