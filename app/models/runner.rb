class Runner < ActiveRecord::Base
  validates :name,
    :presence   => true,
    :uniqueness => { :case_sensitive => false }

  validates :hardware,
    :presence   => true
end
