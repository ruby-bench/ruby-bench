class Result < ActiveRecord::Base
  belongs_to :run

  validates :benchmark,
    :presence   => true

  validates :score,
    :presence   => true
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
