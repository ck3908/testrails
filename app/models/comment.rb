class Comment < ActiveRecord::Base
  belongs_to :movie

  def self.descending
    order(created_at: :desc)
  end
end
