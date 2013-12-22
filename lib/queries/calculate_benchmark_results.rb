class CalculateBenchmarkResults
  attr_reader :runner, :benchmark

  def initialize(runner, benchmark)
    @runner = runner
    @benchmark = benchmark
  end

  def calculate
    runner.runs.includes(:results)
      .where("results.benchmark" => benchmark)
      .group(:ruby_version)
      .average(:score)
  end
end