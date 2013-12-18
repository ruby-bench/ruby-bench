class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def render_errors_for(model, status = :unprocessable_entity)
    render :json => { :errors => model.errors }, :status => status
  end
end
