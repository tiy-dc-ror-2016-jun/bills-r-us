# Preview all emails at http://localhost:3000/rails/mailers/orders_mailer
class OrdersMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/orders_mailer/invoice
  def invoice
    OrdersMailer.invoice
  end

end
