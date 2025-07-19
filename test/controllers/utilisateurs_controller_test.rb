require "test_helper"

class UtilisateursControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get utilisateurs_new_url
    assert_response :success
  end

  test "should get show" do
    get utilisateurs_show_url
    assert_response :success
  end

  test "should get create" do
    get utilisateurs_create_url
    assert_response :success
  end
end
