class OrdersMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.orders_mailer.invoice.subject
  #
  def invoice(inv)
    @invoice = inv
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
