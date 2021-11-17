class ScoresController < ApplicationController
  protect_from_forgery with: :null_session, only: [ :create ] 
  wrap_parameters Score, include: [ :username ], format: [:json], only: [ :create ]

  before_action :authenticate, only: [ :create ]
  # before_action :require_params, only: [ :create ]

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
    scores = []
    created_new_records = false

    params[:_json].each do |p|
      require_params(p)
      user = User.find_or_create_by!(name: p[:username])
      score = Score.find_or_create_by!(user: user, seconds: p[:seconds], published_at: p[:published_at])
      unless created_new_records
        created_new_records = score.previously_new_record?
      end

      scores.push(score.to_json)
    end

    render json: scores, status: created_new_records ? 201 : 200
  end

  private

  def require_params(p)
    p.require([:username, :seconds, :published_at])
  rescue ActionController::ParameterMissing => e 
    render json: { message: e.message }, :status => :bad_request
  end
end
