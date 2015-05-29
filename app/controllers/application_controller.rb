class ApplicationController < ActionController::Base
  layout nil
  protect_from_forgery with: :exception
  respond_to :json
end
