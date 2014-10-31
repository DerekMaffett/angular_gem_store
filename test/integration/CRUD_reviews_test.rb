require 'test_helper'

class ListingProductsTest < ActionDispatch::IntegrationTest
  setup do
    create_products
  end

  test 'can post to reviews' do
    post "/apiv1/products/#{@azurite.id}/reviews",
    { review:
      { stars: 5, body: 'Wow, very review, so data', author: 'doge@email.com' }
    }.to_json,
    { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal 'Wow, very review, so data',
      Review.find_by(author: 'doge@email.com').body
  end

  test 'invalid reviews cannot be posted' do
    count = Review.count

    post "/apiv1/products/#{@azurite.id}/reviews",
    { review:
      { stars: '', body: '', author: 'doge@email.com' }
    }.to_json,
    { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    assert_equal 500, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal count, Review.count
  end

  test 'can update reviews' do
    patch "/apiv1/products/#{@azurite.id}/reviews/#{@azurite.reviews.first.id}",
    { review:
      { author: 'DarthVader@email.com' }
    }.to_json,
    { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal 'DarthVader@email.com',
      Review.find(@azurite.reviews.first.id).author
  end

  test 'can destroy reviews' do
    count = Review.count

    review_id = @azurite.reviews.first.id
    delete "/apiv1/products/#{@azurite.id}/reviews/#{review_id}"

    assert_equal 204, response.status

    assert_equal count - 1, Review.count
    assert_equal nil, Review.where(id: review_id).first
  end
end
