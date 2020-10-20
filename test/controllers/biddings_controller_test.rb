require 'test_helper'

class BiddingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bidding = biddings(:one)
  end

  test "should get index" do
    get biddings_url
    assert_response :success
  end

  test "should get new" do
    get new_bidding_url
    assert_response :success
  end

  test "should create bidding" do
    assert_difference('Bidding.count') do
      post biddings_url, params: { bidding: { budge: @bidding.budge, date: @bidding.date, inspection: @bidding.inspection, modality: @bidding.modality, object: @bidding.object, organ: @bidding.organ, remark: @bidding.remark, status: @bidding.status, value: @bidding.value } }
    end

    assert_redirected_to bidding_url(Bidding.last)
  end

  test "should show bidding" do
    get bidding_url(@bidding)
    assert_response :success
  end

  test "should get edit" do
    get edit_bidding_url(@bidding)
    assert_response :success
  end

  test "should update bidding" do
    patch bidding_url(@bidding), params: { bidding: { budge: @bidding.budge, date: @bidding.date, inspection: @bidding.inspection, modality: @bidding.modality, object: @bidding.object, organ: @bidding.organ, remark: @bidding.remark, status: @bidding.status, value: @bidding.value } }
    assert_redirected_to bidding_url(@bidding)
  end

  test "should destroy bidding" do
    assert_difference('Bidding.count', -1) do
      delete bidding_url(@bidding)
    end

    assert_redirected_to biddings_url
  end
end
