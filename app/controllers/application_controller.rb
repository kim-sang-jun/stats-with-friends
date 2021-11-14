class ApplicationController < ActionController::Base
  TOKEN = "foo"

  private
    def authenticate
      return if Rails.env.development?

      auth_response = authenticate_or_request_with_http_token do |token, options|
        ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
      end
    end
end
