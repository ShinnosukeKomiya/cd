class Cd < ApplicationRecord
  belongs_to :genre
  belongs_to :stock
  has_many :cartitems
  has_many :favs

  def self.search(search)
      if search
        Cd.where(['title LIKE ? OR artist LIKE ?', "%#{search}%","%#{search}%"])
      else
        Cd.all
      end
  end
end
