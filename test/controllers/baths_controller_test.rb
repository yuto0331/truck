require 'test_helper'

class BathsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bath = baths(:one)
  end

  test "should get index" do
    get baths_url
    assert_response :success
  end

  test "should get new" do
    get new_bath_url
    assert_response :success
  end

  test "should create bath" do
    assert_difference('Bath.count') do
      post baths_url, params: { bath: { content: @bath.content, email: @bath.email, image: @bath.image, name: @bath.name, place: @bath.place, user_id: @bath.user_id } }
    end

    assert_redirected_to bath_url(Bath.last)
  end

  test "should show bath" do
    get bath_url(@bath)
    assert_response :success
  end

  test "should get edit" do
    get edit_bath_url(@bath)
    assert_response :success
  end

  test "should update bath" do
    patch bath_url(@bath), params: { bath: { content: @bath.content, email: @bath.email, image: @bath.image, name: @bath.name, place: @bath.place, user_id: @bath.user_id } }
    assert_redirected_to bath_url(@bath)
  end

  test "should destroy bath" do
    assert_difference('Bath.count', -1) do
      delete bath_url(@bath)
    end

    assert_redirected_to baths_url
  end
end
