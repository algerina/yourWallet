require 'test_helper'

class CategoryBillsControllerTest < ActionDispatch::IntegrationTest
  test 'should get category:references' do
    get category_bills_category: references_url
    assert_response :success
  end

  test 'should get bill:references' do
    get category_bills_bill: references_url
    assert_response :success
  end
end
