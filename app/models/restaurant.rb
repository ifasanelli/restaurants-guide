class Restaurant < ApplicationRecord
  belongs_to :cuisine
  has_many_attached :pictures
  has_many_attached :menus
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  enum status: { available: 0, unavailable: 1 }
  validates :name, presence: { message: 'Nome não pode ficar em branco' }
  validates :address, presence: { message: 'Endereço não pode ficar em branco' }
  validates :neighborhood,
            presence: { message: 'Bairro não pode ficar em branco' }
  validates :city, presence: { message: 'Cidade não pode ficar em branco' }
  validates :phone, presence: { message: 'Telefone não pode ficar em branco' }
  validates :phone2, presence: { message: 'Telefone não pode ficar em branco' }
  validates :cost, presence: { message: 'Custo não pode ficar em branco' }
  validates :timmings, presence: { message: 'Horário não pode ficar em branco' }
  validates :map, presence: { message: 'URL do mapa não pode '\
                                            'ficar em branco' }

  def avg_note
    array = []
    ratings.each do |rating|
      array << rating.star unless rating.star.nil?
    end
    if array.empty?
      '-'
    else
      total = array.reduce(0) { |sum, num| sum + num }
      result = total / ratings.count.to_f
      result.to_f.round(1).to_s
    end
  end
end
