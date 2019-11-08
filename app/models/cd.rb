class Cd < ApplicationRecord
  belongs_to :genre
  has_one :stock
  has_many :line_items, dependent: :destroy
  has_many :favs

  def self.search(search)
      if search
        Cd.where(['title LIKE ? OR artist LIKE ?', "%#{search}%","%#{search}%"])
      else
        Cd.all
      end
  end
end
