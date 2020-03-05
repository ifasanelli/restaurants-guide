class Restaurant < ApplicationRecord
  belongs_to :cuisine
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
  validates :latitude, presence: { message: 'Latitude não pode '\
                                            'ficar em branco' }
  validates :longitude, presence: { message: 'Longitude não pode'\
                                             'ficar em branco' }
end
