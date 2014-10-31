require 'test_helper'

class ListingProductsTest < ActionDispatch::IntegrationTest
  setup do
    create_products
  end

  test 'listing basic product features' do
    get '/apiv1/products'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal Product.count, json(response)['products'].size
    assert_equal @azurite.name, json(response)['products'][0]['name']
    assert_equal @azurite.shine, json(response)['products'][0]['shine']
    assert_equal @azurite.price, json(response)['products'][0]['price']
    assert_equal @azurite.price, json(response)['products'][0]['price']
    assert_equal @azurite.rarity, json(response)['products'][0]['rarity']
    assert_equal @azurite.color, json(response)['products'][0]['color']
    assert_equal @azurite.faces, json(response)['products'][0]['faces']
  end

  test 'listing products with associated reviews and images' do
    get '/apiv1/products'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal [], json(response)['products'][2]['reviews']
    assert_equal [], json(response)['products'][2]['images']
    assert_equal @azurite.images.first.url,
      json(response)['products'][0]['images'][0]['url']
    assert_equal @azurite.reviews.first.body,
      json(response)['products'][0]['reviews'][0]['body']
  end

  test 'lists products in accordance with categories' do
    get '/apiv1/products?price=expensive'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal @zircon.name, json(response)['products'][0]['name']
  end


end
