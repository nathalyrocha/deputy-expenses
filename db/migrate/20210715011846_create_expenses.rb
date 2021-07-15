class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :net_value
      t.date :emission_date
      t.string :description
      t.references :provider, null: false, foreign_key: true
      t.references :deputy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
