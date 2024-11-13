class CreateLanguages < ActiveRecord::Migration[7.2]
  def change
    create_table :languages do |t|
      t.string :code
      t.string :name
      t.string :native
      t.references :location, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
