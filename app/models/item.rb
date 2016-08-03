class Item < ActiveRecord::Base
  belongs_to :invoice

  validates :name, presence: true
  validates :unit_price, presence: true, numericality: {greater_than: 0}
  validates :quantity, presence: true, numericality: {greater_than: 0, message: "Fill in a number yo"}

  def unit_price
    self.unit_price_in_cents.to_i / 100.0
  end

  def unit_price=(price)
    self.unit_price_in_cents = price.to_f * 100
  end
end
