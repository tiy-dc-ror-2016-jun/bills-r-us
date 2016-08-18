class AddAmountPaidInCentsToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :amount_paid_in_cents, :integer
  end
end
