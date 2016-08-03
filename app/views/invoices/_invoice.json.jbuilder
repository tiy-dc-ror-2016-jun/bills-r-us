json.extract! invoice, :id, :total_in_cents, :total_tax_in_cents, :subtotal_in_cents, :tax_rate, :comments, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)