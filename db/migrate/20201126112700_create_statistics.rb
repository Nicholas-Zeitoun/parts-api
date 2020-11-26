class CreateStatistics < ActiveRecord::Migration[6.0]
  def change
    create_table :statistics do |t|
      t.string :unitprice
      t.string :unitofmeas
      t.string :attritioncoap
      t.string :attritionplanned
      t.string :attritioncoad
      t.references :part, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
