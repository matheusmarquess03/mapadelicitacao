require "application_system_test_case"

class CertificatesTest < ApplicationSystemTestCase
  setup do
    @certificate = certificates(:one)
  end

  test "visiting the index" do
    visit certificates_url
    assert_selector "h1", text: "Certificates"
  end

  test "creating a Certificate" do
    visit certificates_url
    click_on "New Certificate"

    fill_in "Book", with: @certificate.book
    fill_in "Company name", with: @certificate.company_name
    fill_in "Deadline", with: @certificate.deadline
    fill_in "Description", with: @certificate.description
    fill_in "End date", with: @certificate.end_date
    fill_in "Item", with: @certificate.item
    fill_in "Kind of service", with: @certificate.kind_of_service
    fill_in "Number", with: @certificate.number
    fill_in "Object", with: @certificate.object
    fill_in "Path file", with: @certificate.path_file
    fill_in "Quantity", with: @certificate.quantity
    fill_in "Responsible enginner", with: @certificate.responsible_enginner
    fill_in "Start date", with: @certificate.start_date
    fill_in "Unit", with: @certificate.unit
    fill_in "Value", with: @certificate.value
    fill_in "Work site", with: @certificate.work_site
    fill_in "Year", with: @certificate.year
    click_on "Create Certificate"

    assert_text "Certificate was successfully created"
    click_on "Back"
  end

  test "updating a Certificate" do
    visit certificates_url
    click_on "Edit", match: :first

    fill_in "Book", with: @certificate.book
    fill_in "Company name", with: @certificate.company_name
    fill_in "Deadline", with: @certificate.deadline
    fill_in "Description", with: @certificate.description
    fill_in "End date", with: @certificate.end_date
    fill_in "Item", with: @certificate.item
    fill_in "Kind of service", with: @certificate.kind_of_service
    fill_in "Number", with: @certificate.number
    fill_in "Object", with: @certificate.object
    fill_in "Path file", with: @certificate.path_file
    fill_in "Quantity", with: @certificate.quantity
    fill_in "Responsible enginner", with: @certificate.responsible_enginner
    fill_in "Start date", with: @certificate.start_date
    fill_in "Unit", with: @certificate.unit
    fill_in "Value", with: @certificate.value
    fill_in "Work site", with: @certificate.work_site
    fill_in "Year", with: @certificate.year
    click_on "Update Certificate"

    assert_text "Certificate was successfully updated"
    click_on "Back"
  end

  test "destroying a Certificate" do
    visit certificates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Certificate was successfully destroyed"
  end
end
