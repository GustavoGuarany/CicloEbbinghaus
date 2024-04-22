require "test_helper"

class ConteudosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get conteudos_index_url
    assert_response :success
  end

  test "should get show" do
    get conteudos_show_url
    assert_response :success
  end

  test "should get new" do
    get conteudos_new_url
    assert_response :success
  end

  test "should get edit" do
    get conteudos_edit_url
    assert_response :success
  end
end
