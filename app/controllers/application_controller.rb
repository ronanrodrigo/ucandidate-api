class ApplicationController < ActionController::Base
  layout nil
  protect_from_forgery with: :exception
  respond_to :json

  skip_before_filter :verify_authenticity_token

end
