require "application_system_test_case"

class PurchasersTest < ApplicationSystemTestCase
  setup do
    @purchaser = purchasers(:one)
  end

  test "visiting the index" do
    visit purchasers_url
    assert_selector "h1", text: "Purchasers"
  end

  test "should create purchaser" do
    visit purchasers_url
    click_on "New purchaser"

    fill_in "item_description", with: @purchaser.item_description
    fill_in "item_price", with: @purchaser.item_price
    fill_in "merchant_address", with: @purchaser.merchant_address
    fill_in "merchant_name", with: @purchaser.merchant_name
    fill_in "total_income",	with: @purchaser.total_income
    fill_in "purchase_count", with: @purchaser.purchase_count
    fill_in "purchaser_name", with: @purchaser.purchaser_name
    click_on "Create Purchaser"

    assert_text "Purchaser was successfully created"
    click_on "Back"
  end

  test "should update Purchaser" do
    visit purchaser_url(@purchaser)
    click_on "Edit this purchaser", match: :first

    fill_in "item_description", with: @purchaser.item_description
    fill_in "item_price", with: @purchaser.item_price
    fill_in "merchant_address", with: @purchaser.merchant_address
    fill_in "merchant_name", with: @purchaser.merchant_name
    fill_in "total_income",	with: @purchaser.total_income
    fill_in "purchase_count", with: @purchaser.purchase_count
    fill_in "purchaser_name", with: @purchaser.purchaser_name
    click_on "Update Purchaser"

    assert_text "Purchaser was successfully updated"
    click_on "Back"
  end

  test "should destroy Purchaser" do
    visit purchaser_url(@purchaser)
    click_on "Destroy this purchaser", match: :first

    assert_text "Purchaser was successfully destroyed"
  end
end
