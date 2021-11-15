class Score < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :published_at, scope: %i[user_id]

  self.table_name = "nytimes_mini_xword_scores"

  def published_day
    published_at.in_time_zone("America/Los_Angeles").strftime("%b %e %Y")
  end

  def published_time
    published_at.in_time_zone("America/Los_Angeles").strftime("%l:%M:%S %p")
  end
end
