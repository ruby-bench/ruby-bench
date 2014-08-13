# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :result do
    benchmark { generate(:name) }
    score     9.99
    run
  end
end

# == Schema Information
#
# Table name: results
#
#  id         :integer          not null, primary key
#  benchmark  :string(255)
#  score      :decimal(, )      default(0.0)
#  run_id     :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_results_on_run_id  (run_id)
#
