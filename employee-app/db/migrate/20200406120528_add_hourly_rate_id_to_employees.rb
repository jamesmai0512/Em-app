class AddHourlyRateIdToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_reference :employees, :hourly_rate, foreign_key: true
  end
end
