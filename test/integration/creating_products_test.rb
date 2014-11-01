require 'test_helper'

class ListingProductsTest < ActionDispatch::IntegrationTest

  setup do
    create_products
  end

  test 'can post to products' do
    sign_up

    post '/apiv1/products',
    { product:
      { name: 'Testurite', price: 99.99}
    }.to_json,
    { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal 'Testurite', Product.find_by(name: 'Testurite').name
  end

  test 'invalid product cannot be posted' do
    sign_up

    count = Product.count

    post '/apiv1/products',
    { product:
      { name: '' }
    }.to_json,
    { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    assert_equal 500, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal count, Product.count
  end

  test 'non-logged in users cannot post new products' do
    post '/apiv1/products',
    { product:
      { name: 'Testurite', price: 99.99}
    }.to_json,
    { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    assert_equal 401, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal 0, Product.where(name: 'Testurite').count
  end
end
