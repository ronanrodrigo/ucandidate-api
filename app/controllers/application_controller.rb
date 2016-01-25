class ApplicationController < ActionController::Base
  layout nil
  protect_from_forgery with: :exception
  respond_to :json

  skip_before_filter :verify_authenticity_token
  
  def somthing_to_test_hound_ci
    puts "10"
  end

end
