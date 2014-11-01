require 'test_helper'

class ListingProductsTest < ActionDispatch::IntegrationTest

  setup do
    create_products
  end

  test 'can destroy products' do
    sign_up

    count = Product.count

    delete "/apiv1/products/#{@azurite.id}"

    assert_equal 204, response.status

    assert_equal count - 1, Product.count
    assert_equal nil, Product.where(id: @azurite.id).first
  end
end
