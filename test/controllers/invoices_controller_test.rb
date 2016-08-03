require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
  setup do
    @invoice = invoices(:huge)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post :create, invoice: { comments: @invoice.comments, subtotal_in_cents: @invoice.subtotal_in_cents, tax_rate: @invoice.tax_rate, total_in_cents: @invoice.total_in_cents, total_tax_in_cents: @invoice.total_tax_in_cents }
    end

    assert_redirected_to invoice_path(assigns(:invoice))
  end

  test "should show invoice" do
    get :show, id: @invoice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoice
    assert_response :success
  end

  test "should update invoice" do
    patch :update, id: @invoice, invoice: { comments: @invoice.comments, subtotal_in_cents: @invoice.subtotal_in_cents, tax_rate: @invoice.tax_rate, total_in_cents: @invoice.total_in_cents, total_tax_in_cents: @invoice.total_tax_in_cents }
    assert_redirected_to invoice_path(assigns(:invoice))
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete :destroy, id: @invoice
    end

    assert_redirected_to invoices_path
  end
end
