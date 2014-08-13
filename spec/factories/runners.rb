# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :runner do
    name
    hardware { generate(:name) }
    token
  end
end

# == Schema Information
#
# Table name: runners
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  hardware   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  token      :string(255)
#
# Indexes
#
#  index_runners_on_name   (name) UNIQUE
#  index_runners_on_token  (token) UNIQUE
#
