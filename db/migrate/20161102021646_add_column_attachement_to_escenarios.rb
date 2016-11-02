class AddColumnAttachementToEscenarios < ActiveRecord::Migration
  def change
    add_attachment :escenarios, :foto
  end
end
