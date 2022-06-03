class AddBillRefToCategoryBills < ActiveRecord::Migration[7.0]
  def change
    add_reference :category_bills, :bill, null: false, foreign_key: true
  end
end
