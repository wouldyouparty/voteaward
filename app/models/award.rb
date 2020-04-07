class Award < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :candidates
  accepts_nested_attributes_for :candidates

  validates :title, presence: true
  validates :body, presence: true

  default_scope {order("id desc")}
end
