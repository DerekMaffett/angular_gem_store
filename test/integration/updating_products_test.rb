require 'test_helper'


class ListingProductsTest < ActionDispatch::IntegrationTest

  setup do
    create_products
  end

  test 'can update products' do
    patch "/apiv1/products/#{@azurite.id}",
    { product:
      { name: 'Azupalite' }
    }

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal 'Azupalite', Product.find(@azurite.id).name
  end
end
