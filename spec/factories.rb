FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password 'StrongPass42'
    date_of_birth Time.now - 20.years
    ssn "0000"
    first_name "John"
    last_name "Last Name"
    street_1 "1 Infinite Loop"
    city "Cupertino"
    state "CA"
    postal_code "95014"
    country_code "US"
  end
end