class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_bills, foreign_key: 'category_id', class_name: 'CategoryBill'

  validates :name, presence: true
  validates :icon, presence: true
end
