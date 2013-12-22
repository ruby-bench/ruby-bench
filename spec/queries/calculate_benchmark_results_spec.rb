require "spec_helper"

describe CalculateBenchmarkResults do
  describe "#calculate" do
    let(:runner) { create(:runner) }
    let(:scores) { [25, 30, 32, 31, 37] }
    subject { CalculateBenchmarkResults.new(runner, "some_bench") }

    before do
      scores.each do |score|
        run = create(:run, :ruby_version => "1.9.2", :runner => runner)
        create(:result, :run => run, :benchmark => "some_bench", :score => score)
      end

      run = create(:run, :ruby_version => "2.0.0", :runner => runner)
      create(:result, :run => run, :benchmark => "some_bench", :score => 21)
      create(:result, :run => run, :benchmark => "another_bench", :score => 55)
    end

    it "returns averaged scores per ruby version" do
      expect(subject.calculate).to eq({"1.9.2" => 31, "2.0.0" => 21})
    end
  end
end
