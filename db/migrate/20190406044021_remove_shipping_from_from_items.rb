class RemoveShippingFromFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :shipping_from, :integer
  end
end
