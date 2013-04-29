require 'test_helper'

class ListShowsControllerTest < ActionController::TestCase
  setup do
    @list_show = list_shows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:list_shows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list_show" do
    assert_difference('ListShow.count') do
      post :create, list_show: { show_id: @list_show.show_id, user_id: @list_show.user_id }
    end

    assert_redirected_to list_show_path(assigns(:list_show))
  end

  test "should show list_show" do
    get :show, id: @list_show
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @list_show
    assert_response :success
  end

  test "should update list_show" do
    put :update, id: @list_show, list_show: { show_id: @list_show.show_id, user_id: @list_show.user_id }
    assert_redirected_to list_show_path(assigns(:list_show))
  end

  test "should destroy list_show" do
    assert_difference('ListShow.count', -1) do
      delete :destroy, id: @list_show
    end

    assert_redirected_to list_shows_path
  end
end
