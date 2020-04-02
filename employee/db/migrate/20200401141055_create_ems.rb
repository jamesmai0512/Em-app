class CreateEms < ActiveRecord::Migration[5.0]
  def change
    create_table :ems do |t|
      t.text :name
      t.text :department
      t.decimal :price

      t.timestamps
    end
  end
end
