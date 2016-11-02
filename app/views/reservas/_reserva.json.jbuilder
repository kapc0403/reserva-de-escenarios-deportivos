json.extract! reserva, :id, :escenario_id, :user_id, :fecha, :horainicio, :horafin, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)