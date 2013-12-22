class RunnersController < ApplicationController
  def show
    runner = Runner.find(params[:id])
    @results = CalculateBenchmarkResults.new(runner, runner_params[:benchmark]).calculate
  end

  private

    def runner_params
      params.require(:runner).permit(:benchmark)
    end
end