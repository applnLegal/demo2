require 'test_helper'

class SciencearticleControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sciencearticle_new_url
    assert_response :success
  end

  test "should get create" do
    get sciencearticle_create_url
    assert_response :success
  end

  test "should get edit" do
    get sciencearticle_edit_url
    assert_response :success
  end

  test "should get update" do
    get sciencearticle_update_url
    assert_response :success
  end

  test "should get delete" do
    get sciencearticle_delete_url
    assert_response :success
  end

end
