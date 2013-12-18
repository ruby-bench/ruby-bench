module API
  module V1
    class ResultsController < ApplicationController

      def create
        if params[:result]
          head :no_content
        else
          head :bad_request
        end
      end

    end
  end
end
