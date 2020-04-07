class Candidate < ApplicationRecord
  belongs_to :district
  belongs_to :party
  has_many :trails
  has_and_belongs_to_many :awards, counter_cache: true

  scoped_search on: [:name]

  default_scope { order("no asc") }

  def likes_count
    trails.sum(:likes_count)
  end

  def dislikes_count
    trails.sum(:dislikes_count)
  end

  def thumb
    "candidates/#{gid}.jpg"
  end
end
