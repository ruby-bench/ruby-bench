require "spec_helper"

describe CalculateBenchmarkResults do
  describe "#calculate" do
    let(:runner) { create(:runner) }
    let(:scores) { [25, 30, 32, 31, 37] }

    before do
      scores.each do |score|
        run = create(:run, :ruby_version => "1.9.2", :runner => runner)
        create(:result, :run => run, :benchmark => "some_bench", :score => score)
      end

      old_run = create(:run, :ruby_version => "1.8.7")
      create(:result, :run => old_run, :benchmark => 'some_bench', :score => 20)

      run = create(:run, :ruby_version => "2.0.0", :runner => runner)
      create(:result, :run => run, :benchmark => "some_bench", :score => 21)
      create(:result, :run => run, :benchmark => "another_bench", :score => 55)
    end

    describe "with a runner" do
      subject { CalculateBenchmarkResults.new(runner: runner, benchmark: "some_bench") }

      it "returns averaged scores per ruby version" do
        expect(subject.calculate).to eq({"1.9.2" => 31, "2.0.0" => 21})
      end
    end

    describe "without a runner" do
      subject { CalculateBenchmarkResults.new(benchmark: "some_bench") }

      it "returns averaged scores per ruby version without the runner scope" do
        expect(subject.calculate).to eq({"1.9.2" => 31, "2.0.0" => 21, "1.8.7" => 20})
      end
    end

    describe "without a benchmark" do
      subject { CalculateBenchmarkResults.new }

      it "returns averaged scores per ruby version without the benchmark scope" do
        expect(subject.calculate).to eq({"1.9.2" => 31, "2.0.0" => 38, "1.8.7" => 20})
      end
    end
  end
end
