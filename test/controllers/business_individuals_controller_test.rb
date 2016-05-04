require 'test_helper'

class BusinessIndividualsControllerTest < ActionController::TestCase
  setup do
    @business_individual = business_individuals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:business_individuals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business_individual" do
    assert_difference('BusinessIndividual.count') do
      post :create, business_individual: { Account_no: @business_individual.Account_no, Bank_name: @business_individual.Bank_name, IFSC: @business_individual.IFSC, Pan: @business_individual.Pan, city: @business_individual.city, mobile: @business_individual.mobile, name: @business_individual.name, referal: @business_individual.referal }
    end

    assert_redirected_to business_individual_path(assigns(:business_individual))
  end

  test "should show business_individual" do
    get :show, id: @business_individual
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business_individual
    assert_response :success
  end

  test "should update business_individual" do
    patch :update, id: @business_individual, business_individual: { Account_no: @business_individual.Account_no, Bank_name: @business_individual.Bank_name, IFSC: @business_individual.IFSC, Pan: @business_individual.Pan, city: @business_individual.city, mobile: @business_individual.mobile, name: @business_individual.name, referal: @business_individual.referal }
    assert_redirected_to business_individual_path(assigns(:business_individual))
  end

  test "should destroy business_individual" do
    assert_difference('BusinessIndividual.count', -1) do
      delete :destroy, id: @business_individual
    end

    assert_redirected_to business_individuals_path
  end
end
