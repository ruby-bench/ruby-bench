class Runner < ActiveRecord::Base
  has_many :runs

  validates :name,
    :presence   => true,
    :uniqueness => { :case_sensitive => false }

  validates :token,
    :presence   => true,
    :uniqueness => { :case_sensitive => false }

  validates :hardware,
    :presence   => true

  def to_s
    "#{name} (#{hardware})"
  end
end
