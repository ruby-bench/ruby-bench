# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :run do
    ruby_version { generate(:name) }
    git_hash     { generate(:token) }
    date         1.day.ago
    runner
  end
end
