class Comment < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  enum status: { pendent: 0, approved: 5 }
end
