class FullAd < ApplicationRecord
  has_one_attached :fullpage_ad
  belongs_to :restaurant
  validates :name, presence: { message: 'Nome não pode ficar em branco' }
end
