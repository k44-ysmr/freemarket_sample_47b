class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,                   null: false, index: true
      t.string :description,            null: false
      t.integer :price,                 null: false
      t.integer :condition,             null: false
      t.integer :shipping_fee,          null: false
      t.integer :shipping_from,         null: false
      t.integer :days_before_shipping,  null: false
      t.integer :shipping_method,       null: false
      t.integer :trade_status,          null: false

      t.references :brand, index: true, foreign_key: true
      t.references :category, null: false, index: true, foreign_key: true
      t.references :size, null: false, index: true, foreign_key: true
      t.references :user, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
