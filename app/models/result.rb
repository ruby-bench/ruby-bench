class Result < ActiveRecord::Base
  belongs_to :run

  validates :benchmark,
    :presence   => true

  validates :score,
    :presence   => true
end
