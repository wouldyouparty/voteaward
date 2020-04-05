class Candidate < ApplicationRecord
  belongs_to :district
  belongs_to :party
  has_many :trails

  scoped_search on: [:name]

  default_scope { order("no asc") }

  def likes_count
    trails.sum(:likes_count)
  end

  def dislikes_count
    trails.sum(:dislikes_count)
  end
end
