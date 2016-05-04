require 'test_helper'

class WelcomsControllerTest < ActionController::TestCase
  setup do
    @welcom = welcoms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:welcoms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create welcom" do
    assert_difference('Welcom.count') do
      post :create, welcom: {  }
    end

    assert_redirected_to welcom_path(assigns(:welcom))
  end

  test "should show welcom" do
    get :show, id: @welcom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @welcom
    assert_response :success
  end

  test "should update welcom" do
    patch :update, id: @welcom, welcom: {  }
    assert_redirected_to welcom_path(assigns(:welcom))
  end

  test "should destroy welcom" do
    assert_difference('Welcom.count', -1) do
      delete :destroy, id: @welcom
    end

    assert_redirected_to welcoms_path
  end
end
