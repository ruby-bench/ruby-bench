class StoreBenchmarkResults
  include Wisper::Publisher

  def initialize(params, runner)
    @params = params
    @runner = runner
  end

  def execute
    run = @runner.runs.create(secure_params)

    if run.valid?
      publish :success, run
    else
      publish :failure, run
    end
  end

  private

    def secure_params
      ActionController::Parameters.new(@params)
        .permit(
          :ruby_version,
          :git_hash,
          :date,
          :results_attributes => [:benchmark, :score]
        )
    end
end