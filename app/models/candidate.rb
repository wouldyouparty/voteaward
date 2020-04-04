class Candidate < ApplicationRecord
  belongs_to :district
  belongs_to :party

  scoped_search on: [:name]
end
