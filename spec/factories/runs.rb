# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :run do
    ruby_version { generate(:name) }
    git_hash     { generate(:token) }
    date         1.day.ago
    runner
  end
end

# == Schema Information
#
# Table name: runs
#
#  id             :integer          not null, primary key
#  ruby_version   :string(255)
#  git_hash       :string(255)
#  date           :datetime
#  runner_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#  rails_version  :string(255)
#  rails_git_hash :string(255)
#
# Indexes
#
#  index_runs_on_runner_id  (runner_id)
#
