module API
  module V1
    class ResultsController < ApiController
      before_action :ensure_runner!

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

    end
  end
end
