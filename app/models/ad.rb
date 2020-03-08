class Ad < ApplicationRecord
  belongs_to :restaurant
  validates :name, presence: { message: 'Nome não pode ficar em branco' }
end
