class RunnersController < ApplicationController
  def show
    @runner  = Runner.find(params[:id]).decorate
    @results = @runner.results
  end
end
