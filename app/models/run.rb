class Run < ActiveRecord::Base
  belongs_to  :runner
  has_many    :results

  accepts_nested_attributes_for :results

  validates :ruby_version,
    :presence   => true

  validates :date,
    :presence   => true
end
