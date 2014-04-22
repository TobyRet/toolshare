class RemoveLocationFromTools < ActiveRecord::Migration
  def change
    remove_column :tools, :location, :string
  end
end
