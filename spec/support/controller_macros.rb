module ControllerMacros
  def headers
    before(:each) do
      @request.env["HTTP_ACCEPT"] = 'application/json'
      @request.env["Accept"] = 'application/vnd.ucandidate.v1'
    end
  end
end