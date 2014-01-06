FactoryGirl.define do
  sequence(:name) { |n| "Name #{n}" }
  sequence(:token) { |n| "token#{n}" }
end
