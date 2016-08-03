class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :total_in_cents
      t.integer :total_tax_in_cents
      t.integer :subtotal_in_cents
      t.float :tax_rate
      t.text :comments

      t.timestamps null: false
    end
  end
end
