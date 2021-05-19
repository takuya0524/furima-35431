class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :burden
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :state
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
  validates :name
  validates :description
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :image
  end

  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :state_id
  validates :burden_id
  validates :prefecture_id
  validates :days_id
  end
end