class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: -> { request.format.json? }

  protected

  def after_sign_in_path_for(resource)
    resource ? admin_path : root_path
  end
end
