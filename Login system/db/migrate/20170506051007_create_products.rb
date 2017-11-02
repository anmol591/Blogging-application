class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
    t.string :name, :limit=>100, :null=>false
    t.decimal :price, :null=>false
    t.references :category
      t.timestamps
    end
  end
end
