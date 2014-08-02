require 'spec_helper'

describe Result do
  describe "validation" do
    it "is valid with valid attributes" do
      expect(build(:result)).to be_valid
    end

    describe "benchmark" do
      it "cannot be blank" do
        expect(build(:result, :benchmark => nil)).to_not be_valid
      end
    end

    describe "score" do
      it "cannot be blank" do
        expect(build(:result, :score => nil)).to_not be_valid
      end
    end
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
