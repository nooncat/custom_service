require "application_system_test_case"

class Cabinet::SellingsTest < ApplicationSystemTestCase
  setup do
    @selling = Sellings.first
  end

  test "visiting the index" do
    visit sellings_url
    assert_selector "h1", text: "Sellings"
  end

  test "creating a Selling" do
    visit sellings_url
    click_on "New Selling"

    fill_in "Description", with: @selling.description
    fill_in "Measure", with: @selling.measure
    fill_in "Nds Percent", with: @selling.nds_percent
    fill_in "Nds Total", with: @selling.nds_total
    fill_in "Price", with: @selling.price
    fill_in "Quantity", with: @selling.quantity
    fill_in "Temporary Storage Warehouse Transaction", with: @selling.temporary_storage_warehouse_transaction_id
    click_on "Create Selling"

    assert_text "Selling was successfully created"
    click_on "Back"
  end

  test "updating a Selling" do
    visit sellings_url
    click_on "Edit", match: :first

    fill_in "Description", with: @selling.description
    fill_in "Measure", with: @selling.measure
    fill_in "Nds Percent", with: @selling.nds_percent
    fill_in "Nds Total", with: @selling.nds_total
    fill_in "Price", with: @selling.price
    fill_in "Quantity", with: @selling.quantity
    fill_in "Temporary Storage Warehouse Transaction", with: @selling.temporary_storage_warehouse_transaction_id
    click_on "Update Selling"

    assert_text "Selling was successfully updated"
    click_on "Back"
  end

  test "destroying a Selling" do
    visit sellings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Selling was successfully destroyed"
  end
end
