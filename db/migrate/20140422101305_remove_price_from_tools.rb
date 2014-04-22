class RemovePriceFromTools < ActiveRecord::Migration
  def change
    remove_column :tools, :price, :float
  end
end
