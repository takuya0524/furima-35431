class Furima < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :burden_id, presence:true
  validates :locality_id, presence: true
  validates :days_id, presence: true
  validates :price, presence: true
  validates :user, presence: true, foreign_key: true
end
