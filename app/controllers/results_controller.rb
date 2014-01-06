class ResultsController < ApplicationController
  def show
    @runner  = Runner.find(params[:runner_id]).decorate
    @result  = Result.find params[:id]
    @results = CalculateBenchmarkResults.new(@runner, @benchmark).calculate
  end
end
