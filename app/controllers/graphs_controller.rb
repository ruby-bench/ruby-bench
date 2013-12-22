class GraphsController < ApplicationController
  def display
    runner = Runner.find(graph_params[:runner_id])
    @results = CalculateBenchmarkResults.new(runner, graph_params[:benchmark]).calculate
  end

  private

    def graph_params
      params.require(:graph).permit(:runner_id, :benchmark)
    end
end