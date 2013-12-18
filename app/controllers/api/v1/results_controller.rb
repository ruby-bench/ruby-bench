module API
  module V1
    class ResultsController < ApplicationController

      def create
        runner = Runner.find_or_initialize_by(name: runner_params[:name])
        runner.hardware = runner_params[:hardware]

        if runner.save
          head :no_content
        else
          render_errors_for(runner)
        end
      end

      private

      def runner_params
        params.require(:runner).permit(:name, :hardware)
      end

    end
  end
end
