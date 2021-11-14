class ApplicationController < ActionController::Base
  SCORES_SECRET = ENV["SCORES_SECRET"]

  private
    def authenticate
      return if Rails.env.development?

      authenticate_or_request_with_http_token do |token, options|
        ActiveSupport::SecurityUtils.secure_compare(token, SCORES_SECRET)
        # JWT.decode token, SCORES_SECRET, true, { algorithm: 'HS256' }
      end
    end
end
