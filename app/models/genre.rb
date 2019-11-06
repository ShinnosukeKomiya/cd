class Genre < ApplicationRecord
  has_many :cds

  # IDが一致
  #scope :id_is, -> id {
  #  where(id: id)
  #}
end
