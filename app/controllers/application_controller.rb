class ApplicationController < ActionController::API
  def password
    @auth_errors = validation_errors(params[:key])
  end
end
