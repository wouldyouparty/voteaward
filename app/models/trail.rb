class Trail < ApplicationRecord
  belongs_to :user
  belongs_to :candidate

  validates :body, presence: true

  default_scope {order("id desc")}
end
