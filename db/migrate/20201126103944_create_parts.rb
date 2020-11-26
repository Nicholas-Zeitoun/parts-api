class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.string :partroot
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
