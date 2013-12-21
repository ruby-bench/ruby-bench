module API
  module V1
    class ApiController < ActionController::Base
      private

        def render_errors_for(model, status = :unprocessable_entity)
          render :json => { :errors => model.errors }, :status => status
        end

        def ensure_runner!
          authenticate_or_request_with_http_token do |token, options|
            @current_runner = Runner.find_by(:token => token)
          end
        end

        def current_runner
          @current_runner
        end
    end
  end
end