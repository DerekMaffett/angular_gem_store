ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require 'minitest/rails/capybara'
require 'capybara/poltergeist'

Capybara.default_driver = :poltergeist

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

    # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def json(response)
    JSON::parse(response.body)
  end

  def sign_up
    data = {
      admin: {
        email: 'test@email.com',
        password: 'password',
        password_comfirmation: 'password'
       }
    }.to_json

    post '/admins', data,
      { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

  end

  def create_products
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
    @azurite.reviews.create!([
      {
        stars: 5,
        body: 'This is an awesome gem. I highly recommend it',
        author: 'Jimmy@email.com'
      },
      {
        stars: 2,
        body: 'This gem ate my cat. Kinda sparkly, though',
        author: 'DispleasedCatLover@email.com'
      }
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
end
