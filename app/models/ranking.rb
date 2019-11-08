class Ranking < ApplicationRecord
  belongs_to :fav

  # LOGIC
  def popular
    sum = 0
    self.favs.each do |fav|
      sum+= fav.count
    end
    return sum
  end
end
