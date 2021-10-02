class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :price
      t.string :category
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
end
