class CreateCatHobbies < ActiveRecord::Migration[5.0]
  def change
    create_table :cat_hobbies do |t|
      t.belongs_to :cat, foreign_key: true
      t.belongs_to :hobby, foreign_key: true

      t.timestamps
    end
  end
end
