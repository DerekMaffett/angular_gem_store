require 'test_helper'

class ListingProductsTest < ActionDispatch::IntegrationTest
  setup do
    @azurite = Product.create!(
      name: 'Azurite',
      description: 'Some gems have hidden qualities beyond their luster,
        beyond their shine... Azurite is one of those gems.',
      shine: 8,
      price: 110.50,
      rarity: 7,
      color: '#CCC',
      faces: 14
    )
    @azurite.images.create!([
      { url: 'images/gem-02.gif' },
      { url: 'images/gem-05.gif' },
      { url: 'images/gem-09.gif' }
      ])
    @bloodstone = Product.create!(
      name: 'Bloodstone',
      description: 'Some gems have hidden qualities beyond their
        luster, beyond their shine... Azurite is one of those gems.',
      shine: 9,
      price: 29.90,
      rarity: 6,
      color: '#EEE',
      faces: 12
    )
    @bloodstone.images.create!([
      { url: 'images/gem-01.gif' },
      { url: 'images/gem-03.gif' },
      { url: 'images/gem-04.gif' }
    ])
    @zircon = Product.create!(
      name: 'Zircon',
      description: 'Zircon is our most coveted and sought after gem.
        You will pay much to be the proud owner of this gorgeous and
        high shine gem.',
      shine: 70,
      price: 1100,
      rarity: 2,
      color: '#000',
      faces: 6
    )
  end

  test 'listing basic product features' do
    get '/apiv1/products.json'

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
    get '/apiv1/products.json'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal [], json(response)['products'][2]['reviews']
    assert_equal [], json(response)['products'][2]['images']
    assert_equal @azurite.images.first.url,
      json(response)['products'][0]['images'][0]['url']
  end
end
