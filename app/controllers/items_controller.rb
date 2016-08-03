class ItemsController < ApplicationController
  def new
    @item = Item.new
    @invoice = Invoice.find(params["invoice_id"])
  end

  def create
    @item = Item.new(item_params)
    @item.invoice_id = params["invoice_id"]

    if @item.save
      redirect_to invoice_path(id: @item.invoice_id)
    else
      render :new
    end
  end

  def edit
    @invoice = Invoice.find(params["invoice_id"])
    @item = Item.find(params["id"])
  end

  def update

    # flash[:error] = "Victory"
    # flash[:success] = "Victory"
    @item = Item.find(params["id"])
    @invoice = Invoice.find(params["invoice_id"])

    if @item.update(item_params)
      redirect_to invoice_path(@item.invoice_id), notice: "Victory you successfully updated item #{@item.id}"
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params["id"])
    @item.destroy

    redirect_to invoice_path(@item.invoice_id), notice: "We blew up item #{@item.id}"
  end

  private def item_params
    params.require("item").permit(:invoice_id, :name, :description, :quantity, :unit_price)
  end
end
