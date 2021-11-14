class WelcomeController < ApplicationController
  before_action :authenticate, except: [ :index ]
end
