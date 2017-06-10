require 'test_helper'

class VendorsControllerTest < ActionController::TestCase
  setup do
    @promotion = promotions(:one)
    @vendor = vendors(:one)
  end

  test "should get index" do
    get :index, params: { promotion_id: @promotion }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { promotion_id: @promotion }
    assert_response :success
  end

  test "should create vendor" do
    assert_difference('Vendor.count') do
      post :create, params: { promotion_id: @promotion, vendor: @vendor.attributes }
    end

    assert_redirected_to promotion_vendor_path(@promotion, Vendor.last)
  end

  test "should show vendor" do
    get :show, params: { promotion_id: @promotion, id: @vendor }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { promotion_id: @promotion, id: @vendor }
    assert_response :success
  end

  test "should update vendor" do
    put :update, params: { promotion_id: @promotion, id: @vendor, vendor: @vendor.attributes }
    assert_redirected_to promotion_vendor_path(@promotion, Vendor.last)
  end

  test "should destroy vendor" do
    assert_difference('Vendor.count', -1) do
      delete :destroy, params: { promotion_id: @promotion, id: @vendor }
    end

    assert_redirected_to promotion_vendors_path(@promotion)
  end
end
