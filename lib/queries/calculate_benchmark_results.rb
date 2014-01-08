class CalculateBenchmarkResults
  attr_reader :runner, :benchmark

  def initialize(runner: nil, benchmark: nil)
    @runner = runner
    @benchmark = benchmark
  end

  def calculate
    Run.includes(:results)
      .where(runner_condition)
      .where(benchmark_condition)
      .group(:ruby_version)
      .order(:ruby_version)
      .average(:score)
  end

  def runner_condition
    runner ? {runner_id: runner.id} : {}
  end

  def benchmark_condition
    benchmark ? {results: {benchmark: benchmark}} : {}
  end
end
