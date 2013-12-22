class RunnersController < ApplicationController
  def show
    @runner = Runner.find(params[:id]).decorate
    @benchmark = runner_params[:benchmark]
    @results = CalculateBenchmarkResults.new(@runner, @benchmark).calculate
  end

  private

    def runner_params
      params.require(:runner).permit(:benchmark)
    end
end
