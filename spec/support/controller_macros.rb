module ControllerMacros
  def headers
    before(:each) do
      @request.env["HTTP_ACCEPT"] = 'application/json'
    end
  end
end