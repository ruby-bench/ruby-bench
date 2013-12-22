class RunnersController < ApplicationController
  def show
    runner = Runner.find(runner_params[:id])
    @results = CalculateBenchmarkResults.new(runner, runner_params[:benchmark]).calculate
  end

  private

    def runner_params
      params.require(:runner).permit(:id, :benchmark)
    end
end