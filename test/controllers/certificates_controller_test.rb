require 'test_helper'

class CertificatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @certificate = certificates(:one)
  end

  test "should get index" do
    get certificates_url
    assert_response :success
  end

  test "should get new" do
    get new_certificate_url
    assert_response :success
  end

  test "should create certificate" do
    assert_difference('Certificate.count') do
      post certificates_url, params: { certificate: { book: @certificate.book, company_name: @certificate.company_name, deadline: @certificate.deadline, description: @certificate.description, end_date: @certificate.end_date, item: @certificate.item, kind_of_service: @certificate.kind_of_service, number: @certificate.number, object: @certificate.object, path_file: @certificate.path_file, quantity: @certificate.quantity, responsible_enginner: @certificate.responsible_enginner, start_date: @certificate.start_date, unit: @certificate.unit, value: @certificate.value, work_site: @certificate.work_site, year: @certificate.year } }
    end

    assert_redirected_to certificate_url(Certificate.last)
  end

  test "should show certificate" do
    get certificate_url(@certificate)
    assert_response :success
  end

  test "should get edit" do
    get edit_certificate_url(@certificate)
    assert_response :success
  end

  test "should update certificate" do
    patch certificate_url(@certificate), params: { certificate: { book: @certificate.book, company_name: @certificate.company_name, deadline: @certificate.deadline, description: @certificate.description, end_date: @certificate.end_date, item: @certificate.item, kind_of_service: @certificate.kind_of_service, number: @certificate.number, object: @certificate.object, path_file: @certificate.path_file, quantity: @certificate.quantity, responsible_enginner: @certificate.responsible_enginner, start_date: @certificate.start_date, unit: @certificate.unit, value: @certificate.value, work_site: @certificate.work_site, year: @certificate.year } }
    assert_redirected_to certificate_url(@certificate)
  end

  test "should destroy certificate" do
    assert_difference('Certificate.count', -1) do
      delete certificate_url(@certificate)
    end

    assert_redirected_to certificates_url
  end
end
