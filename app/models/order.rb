class Order < ApplicationRecord
  belongs_to :user
  has_many :cartitems
  has_many :cartcds, through: :cartitems, source: :cd
  accepts_nested_attributes_for :cartitems, allow_destroy: true
end
