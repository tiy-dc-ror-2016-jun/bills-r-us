class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_sales, except: [:index,  :show]
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @page = params[:page].to_i
    per_page = 10
    @invoices = Invoice.page(@page).per(per_page)
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @items = @invoice.items
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
        format.js
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
        format.js { render :update }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_email
    @invoice = Invoice.find(params[:id])

    OrdersMailer.invoice.deliver_later

    redirect_to invoice_path(id: @invoice.id), notice: 'We sent an email.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def authorize_sales
      redirect_to invoices_path, notice: "Not Allowed, I'm Telling" unless current_user.sales?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:total_in_cents, :total_tax_in_cents, :subtotal_in_cents, :tax_rate, :comments)
    end
end
