class CreateSizeCharts < ActiveRecord::Migration[5.2]
  def change
    create_table :size_charts do |t|
      t.references :category, null: false, index: true, foreign_key: true
      t.references :size, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
