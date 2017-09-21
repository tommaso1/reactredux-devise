class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include CanCan::ControllerAdditions
  rescue_from CanCan::AccessDenied do |exception|
    render :json => { 'error': 'not authorized' } ,:status => 401
  end

end
