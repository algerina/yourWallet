class Bill < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_bills, dependent: :delete_all
  has_many :categories, through: :category_bills
  
  validates :name, presence: true
  validates :amount, presence: true
end
