class Run < ActiveRecord::Base
  belongs_to  :runner
  has_many    :results

  accepts_nested_attributes_for :results

  validates :ruby_version,
    presence: true

  validates :date,
    presence: true
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
