class Product < ApplicationRecord
  has_many :sub_products #,  inverse_of: :product, dependent: :destroy
  accepts_nested_attributes_for :sub_products, allow_destroy: true, reject_if: :all_blank

  # scope :desc, order("events.event_at DESC")
  scope :cheapest,    -> { order(price: :asc) }
  scope :expensive,   -> { order(price: :desc) }
  scope :newest,   -> { order(created_at: :desc) }

  validates_presence_of :name, :price
  validates :price, numericality: {only_integer: true}
end
