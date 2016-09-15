class CreateCats < ActiveRecord::Migration[5.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :breed
      t.string :temperament
      t.integer :weight
      t.boolean :fluffy, default: false

      t.timestamps
    end
  end
end
