class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :project, index: true
      t.integer :minutes
      t.integer :hours
      t.text :comment
      t.datetime :date

      t.timestamps null: false
    end
  end
end
