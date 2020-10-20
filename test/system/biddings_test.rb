require "application_system_test_case"

class BiddingsTest < ApplicationSystemTestCase
  setup do
    @bidding = biddings(:one)
  end

  test "visiting the index" do
    visit biddings_url
    assert_selector "h1", text: "Biddings"
  end

  test "creating a Bidding" do
    visit biddings_url
    click_on "New Bidding"

    fill_in "Budge", with: @bidding.budge
    fill_in "Date", with: @bidding.date
    fill_in "Inspection", with: @bidding.inspection
    fill_in "Modality", with: @bidding.modality
    fill_in "Object", with: @bidding.object
    fill_in "Organ", with: @bidding.organ
    fill_in "Remark", with: @bidding.remark
    fill_in "Status", with: @bidding.status
    fill_in "Value", with: @bidding.value
    click_on "Create Bidding"

    assert_text "Bidding was successfully created"
    click_on "Back"
  end

  test "updating a Bidding" do
    visit biddings_url
    click_on "Edit", match: :first

    fill_in "Budge", with: @bidding.budge
    fill_in "Date", with: @bidding.date
    fill_in "Inspection", with: @bidding.inspection
    fill_in "Modality", with: @bidding.modality
    fill_in "Object", with: @bidding.object
    fill_in "Organ", with: @bidding.organ
    fill_in "Remark", with: @bidding.remark
    fill_in "Status", with: @bidding.status
    fill_in "Value", with: @bidding.value
    click_on "Update Bidding"

    assert_text "Bidding was successfully updated"
    click_on "Back"
  end

  test "destroying a Bidding" do
    visit biddings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bidding was successfully destroyed"
  end
end
