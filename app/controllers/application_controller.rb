class ApplicationController < ActionController::Base
  SCORES_SECRET = ENV["SCORES_SECRET"]

  private
    def authenticate
      return if Rails.env.development?

      auth_response = authenticate_or_request_with_http_token do |token, options|
        decoded_token = JWT.decode token, SCORES_SECRET, true, { algorithm: 'HS256' }
      end
    end
end
