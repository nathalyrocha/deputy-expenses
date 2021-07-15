class CreateDeputies < ActiveRecord::Migration[6.0]
  def change
    create_table :deputies do |t|
      t.string :name
      t.string :cpf
      t.string :state
      t.references :party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
