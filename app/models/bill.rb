class Bill < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :category_bills
  has_many :categories, through: :category_bills
  
  validates :name, presence: true
  validates :amount, presence: true
end
