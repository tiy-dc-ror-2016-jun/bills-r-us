require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase

  def test_can_have_many_items
    invoice = invoices(:huge)
    item = items(:one)
    assert_includes invoice.items, item
  end

  
end
