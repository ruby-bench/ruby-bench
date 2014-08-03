class Runner < ActiveRecord::Base
  has_many :runs
  has_many :results, through: :runs

  validates :name,
    presence: true,
    uniqueness: { case_sensitive: false }

  validates :token,
    presence: true,
    uniqueness: { case_sensitive: false }

  validates :hardware,
    presence: true
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
