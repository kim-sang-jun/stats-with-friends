class ScoresController < ApplicationController
  protect_from_forgery with: :null_session, only: [ :create ] 
  before_action :authenticate, only: [ :create ]
  before_action :require_params, only: [ :create ]

  def index
    @scores_by_date = {} 

    Score.all.each do |r|
      date = r.published_day

      unless @scores_by_date[date].present? 
        @scores_by_date[date] = [] 
      end 

      @scores_by_date[date].push(r)
    end
  end

  def create
    user = User.find_or_create_by(name: params[:username])
    result = Score.find_or_create_by(user: user, seconds: params[:seconds], published_at: params[:published_at]).save!

    render json: result
  end

  private

  def require_params
    params.require([:username, :seconds, :published_at])
  rescue ActionController::ParameterMissing => e 
    render json: { message: e.message }, :status => :bad_request
  end
end
