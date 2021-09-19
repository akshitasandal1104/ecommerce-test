class Product < ApplicationRecord
  has_many :sub_products #,  inverse_of: :product, dependent: :destroy
  accepts_nested_attributes_for :sub_products, allow_destroy: true, reject_if: :all_blank

  scope :cheapest,    -> { sort {|a, b| a.price <=> b.price} }
  scope :expensive,   -> { sort {|a, b| b.price <=> a.price} }
  scope :newest,   -> { sort {|a, b| b.created_at <=> a.created_at} }

  validates_presence_of :name, :price
  validates :price, :numericality => {:only_integer => true}
end
