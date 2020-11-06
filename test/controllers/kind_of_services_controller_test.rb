require 'test_helper'

class KindOfServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kind_of_service = kind_of_services(:one)
  end

  test "should get index" do
    get kind_of_services_url
    assert_response :success
  end

  test "should get new" do
    get new_kind_of_service_url
    assert_response :success
  end

  test "should create kind_of_service" do
    assert_difference('KindOfService.count') do
      post kind_of_services_url, params: { kind_of_service: { name: @kind_of_service.name } }
    end

    assert_redirected_to kind_of_service_url(KindOfService.last)
  end

  test "should show kind_of_service" do
    get kind_of_service_url(@kind_of_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_kind_of_service_url(@kind_of_service)
    assert_response :success
  end

  test "should update kind_of_service" do
    patch kind_of_service_url(@kind_of_service), params: { kind_of_service: { name: @kind_of_service.name } }
    assert_redirected_to kind_of_service_url(@kind_of_service)
  end

  test "should destroy kind_of_service" do
    assert_difference('KindOfService.count', -1) do
      delete kind_of_service_url(@kind_of_service)
    end

    assert_redirected_to kind_of_services_url
  end
end
