class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.references :escenario, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.date :fecha
      t.time :horainicio
      t.time :horafin

      t.timestamps null: false
    end
  end
end
