class ApplicationController < ActionController::Base
  layout nil
  protect_from_forgery with: :exception
  respond_to :json
  before_filter :set_access

  def set_access
    @response.headers["Access-Control-Allow-Origin"] = "*"
  end
end
