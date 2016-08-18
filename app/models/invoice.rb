class Invoice < ActiveRecord::Base
  has_many :items

  before_save :calculate_totals

  def total
    total_in_cents / 100.0
  end

  def summary
    items.map { |item| "#{item.quantity} #{item.name}" }.join("\n")
  end

  def calculate_totals
    self.total_in_cents = calculate_total_in_cents
    self.total_tax_in_cents = calculate_total_tax_in_cents
    self.subtotal_in_cents = calculate_subtotal_in_cents
  end

  def calculate_total_in_cents
    calculate_subtotal_in_cents + calculate_total_tax_in_cents
  end

  def calculate_total_tax_in_cents
    calculate_subtotal_in_cents * tax_rate.to_f
  end

  def calculate_subtotal_in_cents
    items.sum(:unit_price_in_cents)
  end
end
