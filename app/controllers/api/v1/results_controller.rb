module API
  module V1
    class ResultsController < ApplicationController

      def create
        head :bad_request
      end

    end
  end
end