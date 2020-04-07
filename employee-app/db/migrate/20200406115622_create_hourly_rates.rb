class CreateHourlyRates < ActiveRecord::Migration[5.0]
  def change
    create_table :hourly_rates do |t|
      t.integer :rate

      t.timestamps
    end
  end
end
