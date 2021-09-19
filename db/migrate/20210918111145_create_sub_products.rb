class CreateSubProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_products do |t|
      t.string :name
      t.integer :price
      t.references :product
      t.timestamps
    end
  end
end
