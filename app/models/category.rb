class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :category_bills
  has_many :bills, through: :category_bills
  has_one_attached :icon

  validates :name, presence: true
  validates :icon, presence: true

  def recent_bills
    bills.order('id ASC')
  end
end
