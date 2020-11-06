require "application_system_test_case"

class KindOfServicesTest < ApplicationSystemTestCase
  setup do
    @kind_of_service = kind_of_services(:one)
  end

  test "visiting the index" do
    visit kind_of_services_url
    assert_selector "h1", text: "Kind Of Services"
  end

  test "creating a Kind of service" do
    visit kind_of_services_url
    click_on "New Kind Of Service"

    fill_in "Name", with: @kind_of_service.name
    click_on "Create Kind of service"

    assert_text "Kind of service was successfully created"
    click_on "Back"
  end

  test "updating a Kind of service" do
    visit kind_of_services_url
    click_on "Edit", match: :first

    fill_in "Name", with: @kind_of_service.name
    click_on "Update Kind of service"

    assert_text "Kind of service was successfully updated"
    click_on "Back"
  end

  test "destroying a Kind of service" do
    visit kind_of_services_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kind of service was successfully destroyed"
  end
end
