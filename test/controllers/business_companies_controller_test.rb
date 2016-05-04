require 'test_helper'

class BusinessCompaniesControllerTest < ActionController::TestCase
  setup do
    @business_company = business_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:business_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business_company" do
    assert_difference('BusinessCompany.count') do
      post :create, business_company: { Account_no: @business_company.Account_no, Bank_name: @business_company.Bank_name, IFSC: @business_company.IFSC, Pan: @business_company.Pan, TAN: @business_company.TAN, TIN: @business_company.TIN, city: @business_company.city, company_email: @business_company.company_email, company_name: @business_company.company_name, contact_person: @business_company.contact_person, mobile: @business_company.mobile, referal: @business_company.referal, services: @business_company.services, website_url: @business_company.website_url }
    end

    assert_redirected_to business_company_path(assigns(:business_company))
  end

  test "should show business_company" do
    get :show, id: @business_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business_company
    assert_response :success
  end

  test "should update business_company" do
    patch :update, id: @business_company, business_company: { Account_no: @business_company.Account_no, Bank_name: @business_company.Bank_name, IFSC: @business_company.IFSC, Pan: @business_company.Pan, TAN: @business_company.TAN, TIN: @business_company.TIN, city: @business_company.city, company_email: @business_company.company_email, company_name: @business_company.company_name, contact_person: @business_company.contact_person, mobile: @business_company.mobile, referal: @business_company.referal, services: @business_company.services, website_url: @business_company.website_url }
    assert_redirected_to business_company_path(assigns(:business_company))
  end

  test "should destroy business_company" do
    assert_difference('BusinessCompany.count', -1) do
      delete :destroy, id: @business_company
    end

    assert_redirected_to business_companies_path
  end
end
