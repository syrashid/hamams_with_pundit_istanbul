require 'test_helper'

class HamamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hamam = hamams(:one)
  end

  test "should get index" do
    get hamams_url
    assert_response :success
  end

  test "should get new" do
    get new_hamam_url
    assert_response :success
  end

  test "should create hamam" do
    assert_difference('Hamam.count') do
      post hamams_url, params: { hamam: { name: @hamam.name, user_id: @hamam.user_id } }
    end

    assert_redirected_to hamam_url(Hamam.last)
  end

  test "should show hamam" do
    get hamam_url(@hamam)
    assert_response :success
  end

  test "should get edit" do
    get edit_hamam_url(@hamam)
    assert_response :success
  end

  test "should update hamam" do
    patch hamam_url(@hamam), params: { hamam: { name: @hamam.name, user_id: @hamam.user_id } }
    assert_redirected_to hamam_url(@hamam)
  end

  test "should destroy hamam" do
    assert_difference('Hamam.count', -1) do
      delete hamam_url(@hamam)
    end

    assert_redirected_to hamams_url
  end
end
