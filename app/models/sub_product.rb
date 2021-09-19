class SubProduct < ApplicationRecord
  belongs_to :product, inverse_of: :sub_products
  validates_presence_of :name, :price
  validates :price, :numericality => {:only_integer => true}

  scope :cheapest,    -> { sort {|a, b| a.price <=> b.price} }
  scope :expensive,   -> { sort {|a, b| b.price <=> a.price} }
  scope :newest,   -> { sort {|a, b| b.created_at <=> a.created_at} }
end
