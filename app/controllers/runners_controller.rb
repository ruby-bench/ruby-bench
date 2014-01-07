class RunnersController < ApplicationController
  def show
    @runner  = Runner.find(params[:id]).decorate
    @results = Result.distinct
  end
end
