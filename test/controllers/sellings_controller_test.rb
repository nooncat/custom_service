require 'test_helper'

class SellingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @selling = sellings(:one)
  end

  test "should get index" do
    get sellings_url
    assert_response :success
  end

  test "should get new" do
    get new_selling_url
    assert_response :success
  end

  test "should create selling" do
    assert_difference('Selling.count') do
      post sellings_url, params: { selling: { description: @selling.description, measure: @selling.measure, nds_percent: @selling.nds_percent, nds_total: @selling.nds_total, price: @selling.price, quantity: @selling.quantity, temporary_storage_warehouse_transaction_id: @selling.temporary_storage_warehouse_transaction_id } }
    end

    assert_redirected_to selling_url(Selling.last)
  end

  test "should show selling" do
    get selling_url(@selling)
    assert_response :success
  end

  test "should get edit" do
    get edit_selling_url(@selling)
    assert_response :success
  end

  test "should update selling" do
    patch selling_url(@selling), params: { selling: { description: @selling.description, measure: @selling.measure, nds_percent: @selling.nds_percent, nds_total: @selling.nds_total, price: @selling.price, quantity: @selling.quantity, temporary_storage_warehouse_transaction_id: @selling.temporary_storage_warehouse_transaction_id } }
    assert_redirected_to selling_url(@selling)
  end

  test "should destroy selling" do
    assert_difference('Selling.count', -1) do
      delete selling_url(@selling)
    end

    assert_redirected_to sellings_url
  end
end
