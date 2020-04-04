class Candidate < ApplicationRecord
  belongs_to :district
  belongs_to :party

  acts_as_votable

  scoped_search on: [:name]

  default_scope { order("no asc") }
end
