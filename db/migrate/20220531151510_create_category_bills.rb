class CreateCategoryBills < ActiveRecord::Migration[7.0]
  def change
    create_table :category_bills do |t|

      t.timestamps
    end
  end
end
