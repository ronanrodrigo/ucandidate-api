module Api
  module V1
    class AuthorizationsController < ApplicationController

      # Do a get request to API root path and get authorization token for post/put requests
      #
      #   curl -H 'Accept: application/vnd.ucandidate.v1' http://api.address/v1/authorization # => {authenticity_token: "f454fb65d5bd38..."}
      def authorization
      end
    end
  end
end