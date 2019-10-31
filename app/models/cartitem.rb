class Cartitem < ApplicationRecord
  belongs_to :cd
  belongs_to :order
end
