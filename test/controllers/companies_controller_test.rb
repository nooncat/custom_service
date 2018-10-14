require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get companies_url
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post companies_url, params: { company: { bank_bik: @company.bank_bik, bank_city: @company.bank_city, bank_kor_schet: @company.bank_kor_schet, bank_name: @company.bank_name, bank_schet: @company.bank_schet, email: @company.email, inn: @company.inn, kpp: @company.kpp, ogrn: @company.ogrn, phone: @company.phone, real_address: @company.real_address, uridicheskiy_address: @company.uridicheskiy_address, users_id: @company.users_id } }
    end

    assert_redirected_to company_url(Company.last)
  end

  test "should show company" do
    get company_url(@company)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_url(@company)
    assert_response :success
  end

  test "should update company" do
    patch company_url(@company), params: { company: { bank_bik: @company.bank_bik, bank_city: @company.bank_city, bank_kor_schet: @company.bank_kor_schet, bank_name: @company.bank_name, bank_schet: @company.bank_schet, email: @company.email, inn: @company.inn, kpp: @company.kpp, ogrn: @company.ogrn, phone: @company.phone, real_address: @company.real_address, uridicheskiy_address: @company.uridicheskiy_address, users_id: @company.users_id } }
    assert_redirected_to company_url(@company)
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete company_url(@company)
    end

    assert_redirected_to companies_url
  end
end
