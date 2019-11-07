class LineItem < ApplicationRecord
  belongs_to :cd
  belongs_to :cart

  # LOGIC
  def total_price
    self.quantity * self.cd.price
  end
end
