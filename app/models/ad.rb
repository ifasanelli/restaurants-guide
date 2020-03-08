class Ad < ApplicationRecord
  has_one_attached :mini_ad
  belongs_to :restaurant
  validates :name, presence: { message: 'Nome não pode ficar em branco' }
end
