# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :runner do
    name
    hardware { generate(:name) }
    token
  end
end
