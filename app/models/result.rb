class Result < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user_id, :published_at

  self.table_name = "nytimes_mini_xword_results"
end
