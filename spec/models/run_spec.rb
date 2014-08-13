require 'spec_helper'

describe Run do
  describe "validation" do
    it "is valid with valid attributes" do
      expect(build(:run)).to be_valid
    end

    describe "ruby_version" do
      it "cannot be blank" do
        expect(build(:run, :ruby_version => nil)).to_not be_valid
      end
    end

    describe "date" do
      it "cannot be blank" do
        expect(build(:run, :date => nil)).to_not be_valid
      end
    end
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
