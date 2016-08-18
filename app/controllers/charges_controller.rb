class ChargesController < ApplicationController
  def new
    @invoice = Invoice.find(params[:invoice_id])
  end

  def create
    # Amount in cents
    @invoice = Invoice.find(params[:invoice_id])
    @amount = @invoice.total_in_cents

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Rails Stripe customer",
      currency: "usd"
    )

    @invoice.update(amount_paid_in_cents: @amount)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
