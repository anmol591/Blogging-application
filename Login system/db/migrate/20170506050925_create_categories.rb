class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
    	t.string :name
    	
      t.timestamps
    end
    Category.create :name=>"Mobiles"
    Category.create :name=>"laptops"
  end
end
