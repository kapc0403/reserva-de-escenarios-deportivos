class Reserva < ActiveRecord::Base
  belongs_to :escenario
  belongs_to :user
end
