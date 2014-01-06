# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :result do
    benchmark { generate(:name) }
    score     9.99
    run
  end
end
