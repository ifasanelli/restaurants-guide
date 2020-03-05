class Restaurant < ApplicationRecord
  belongs_to :cuisine
  enum status: { available: 0, unavailable: 5 }
end
