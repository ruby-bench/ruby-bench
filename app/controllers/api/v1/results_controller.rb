module API
  module V1
    class ResultsController < ApiController
      before_action :ensure_runner!

      def create
        run = current_runner.runs.create(run_params)

        if run.valid?
          head :no_content
        else
          render_errors_for(run)
        end
      end

      private

        def run_params
          params
            .require(:run)
            .permit(:ruby_version, :git_hash, :date, :results_attributes => [:benchmark, :score])
        end

    end
  end
end
