# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :run do
    ruby_version "MyString"
    git_hash "MyString"
    date "2013-12-18 21:30:35"
    runner nil
  end
end
