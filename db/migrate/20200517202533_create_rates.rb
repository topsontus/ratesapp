class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.decimal  :rate, precision: 10, scale: 4, null: false, default: 0
      t.decimal  :forced_rate, precision: 10, scale: 4, null: false, default: 0
      t.string   :currency_from
      t.string   :currency_to
      t.datetime :forced_rate_expiration
      t.timestamps
    end

    add_index :rates, :created_at
  end
end
