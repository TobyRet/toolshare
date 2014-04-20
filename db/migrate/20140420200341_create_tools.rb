class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :title
      t.text :body
      t.string :location
      t.float :price

      t.timestamps
    end
  end
end
