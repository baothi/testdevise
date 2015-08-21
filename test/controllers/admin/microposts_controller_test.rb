require 'test_helper'

class Admin::MicropostsControllerTest < ActionController::TestCase
  setup do
    @admin_micropost = admin_microposts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_microposts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_micropost" do
    assert_difference('Admin::Micropost.count') do
      post :create, admin_micropost: { content: @admin_micropost.content, user_id: @admin_micropost.user_id }
    end

    assert_redirected_to admin_micropost_path(assigns(:admin_micropost))
  end

  test "should show admin_micropost" do
    get :show, id: @admin_micropost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_micropost
    assert_response :success
  end

  test "should update admin_micropost" do
    patch :update, id: @admin_micropost, admin_micropost: { content: @admin_micropost.content, user_id: @admin_micropost.user_id }
    assert_redirected_to admin_micropost_path(assigns(:admin_micropost))
  end

  test "should destroy admin_micropost" do
    assert_difference('Admin::Micropost.count', -1) do
      delete :destroy, id: @admin_micropost
    end

    assert_redirected_to admin_microposts_path
  end
end
