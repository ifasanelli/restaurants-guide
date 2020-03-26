class Comment < ApplicationRecord
  belongs_to :restaurant
  enum status: { pendent: 0, approved: 5, rejected: 9 }
end
