class AddStreetAndCityToTools < ActiveRecord::Migration
  def change
    add_column :tools, :street, :string
    add_column :tools, :city, :string
  end
end
