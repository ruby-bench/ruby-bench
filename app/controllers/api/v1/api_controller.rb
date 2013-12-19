module API
  module V1
    class ApiController < ActionController::Base
      private

        def render_errors_for(model, status = :unprocessable_entity)
          render :json => { :errors => model.errors }, :status => status
        end

        def ensure_runner!
          current_runner || head(:unauthorized)
        end

        def current_runner
          @current_runner ||= begin
            current_token && Runner.find_by(:token => current_token)
          end
        end

        def current_token
          env["HTTP_X_AUTH_TOKEN"]
        end
    end
  end
end