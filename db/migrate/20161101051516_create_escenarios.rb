class CreateEscenarios < ActiveRecord::Migration
  def change
    create_table :escenarios do |t|
      t.string :nombre
      t.references :categorium, index: true, foreign_key: true
      t.string :estado

      t.timestamps null: false
    end
  end
end
