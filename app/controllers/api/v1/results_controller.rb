module API
  module V1
    class ResultsController < ApiController
      before_action :ensure_runner!, except: [:index, :show]
      respond_to :json

      def index
        runner = get_runner
        @results = get_results(runner)

        respond_with @results
      end

      def show
        result   = Result.find(params[:id]) if params.key?(:id)
        runner   = get_runner
        @results = get_results(runner, result.benchmark)

        respond_with @results
      end

      def create
        store_results = StoreBenchmarkResults.new(params.require(:run), current_runner)

        store_results.on :success do
          head :no_content
        end

        store_results.on :failure do |run|
          render_errors_for(run)
        end

        store_results.execute
      end

      private
      def get_runner
        Runner.find(params[:runner_id]) if params.key?(:runner_id)
      end

      def get_results(runner, benchmark=nil)
        CalculateBenchmarkResults.new(runner: runner, benchmark: benchmark).calculate
      end

    end
  end
end
