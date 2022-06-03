class AddCategoryRefToCategoryBills < ActiveRecord::Migration[7.0]
  def change
    add_reference :category_bills, :category, null: false, foreign_key: true
  end
end
