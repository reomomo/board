require "test_helper"

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get groups_new_url
    assert_response :success
  end

  test "should get index" do
    get groups_index_url
    assert_response :success
  end

  test "should get edit" do
    get groups_edit_url
    assert_response :success
  end
end
