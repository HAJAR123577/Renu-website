require "test_helper"

class AnnoncesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get annonces_index_url
    assert_response :success
  end

  test "should get new" do
    get annonces_new_url
    assert_response :success
  end

  test "should get edit" do
    get annonces_edit_url
    assert_response :success
  end

  test "should get show" do
    get annonces_show_url
    assert_response :success
  end
end
