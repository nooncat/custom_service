require "application_system_test_case"

class CompaniesTest < ApplicationSystemTestCase
  setup do
    @company = companies(:one)
  end

  test "visiting the index" do
    visit companies_url
    assert_selector "h1", text: "Companies"
  end

  test "creating a Company" do
    visit companies_url
    click_on "New Company"

    fill_in "Bank Bik", with: @company.bank_bik
    fill_in "Bank City", with: @company.bank_city
    fill_in "Bank Kor Schet", with: @company.bank_kor_schet
    fill_in "Bank Name", with: @company.bank_name
    fill_in "Bank Schet", with: @company.bank_schet
    fill_in "Email", with: @company.email
    fill_in "Inn", with: @company.inn
    fill_in "Kpp", with: @company.kpp
    fill_in "Ogrn", with: @company.ogrn
    fill_in "Phone", with: @company.phone
    fill_in "Real Address", with: @company.real_address
    fill_in "Uridicheskiy Address", with: @company.uridicheskiy_address
    fill_in "Users", with: @company.users_id
    click_on "Create Company"

    assert_text "Company was successfully created"
    click_on "Back"
  end

  test "updating a Company" do
    visit companies_url
    click_on "Edit", match: :first

    fill_in "Bank Bik", with: @company.bank_bik
    fill_in "Bank City", with: @company.bank_city
    fill_in "Bank Kor Schet", with: @company.bank_kor_schet
    fill_in "Bank Name", with: @company.bank_name
    fill_in "Bank Schet", with: @company.bank_schet
    fill_in "Email", with: @company.email
    fill_in "Inn", with: @company.inn
    fill_in "Kpp", with: @company.kpp
    fill_in "Ogrn", with: @company.ogrn
    fill_in "Phone", with: @company.phone
    fill_in "Real Address", with: @company.real_address
    fill_in "Uridicheskiy Address", with: @company.uridicheskiy_address
    fill_in "Users", with: @company.users_id
    click_on "Update Company"

    assert_text "Company was successfully updated"
    click_on "Back"
  end

  test "destroying a Company" do
    visit companies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company was successfully destroyed"
  end
end
