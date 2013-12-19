# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :result do
    benchmark "MyString"
    score "9.99"
    run nil
  end
end
