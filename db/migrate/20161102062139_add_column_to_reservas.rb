class AddColumnToReservas < ActiveRecord::Migration
  def change
    add_column :reservas, :estado, :integer
  end
end
