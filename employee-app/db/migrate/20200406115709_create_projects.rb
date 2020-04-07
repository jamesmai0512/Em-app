class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :manager
      t.integer :budget
      t.string :code

      t.timestamps
    end
  end
end
