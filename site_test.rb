# Run tests with the following command: rspec -fd site_test.rb
# frozen_string_literal: true

require './site_framework'
require './item_framework'
require 'rspec'

describe 'OWASP Juice Box Website' do

  # it 'can register a user' do
  #   site = Site.new
  #   site.dismiss_welcome

  #   login_title = site.register_user
  #   # sleep 2
  #   # expect(login_title).to eq('OWASP Juice Shop')
  #   site.finish
  # end

  it 'can login to the dashboard' do
    site = Site.new
    site.dismiss_welcome

    login_title = site.login
    sleep 2
    expect(login_title).to eq('OWASP Juice Shop')
    site.finish
  end

  it 'can navigate to an item' do
    item = Item.new
    item.dismiss_welcome

    item.login
    sleep 2
    item_text = item.select_item 1
    expect(item_text).to start_with 'Apple Juice'
    # item.take_screenshot 'sample1.png'
    item.finish
  end

  it 'can place items in basket' do
    item = Item.new
    item.dismiss_welcome

    item.login
    sleep 2
    confirmation = item.place_in_basket 1
    expect(confirmation).to start_with 'Placed Apple Juice'
    confirmation = item.place_in_basket 2
    expect(confirmation).to start_with 'Placed Apple Pomace'
    confirmation = item.place_in_basket 3
    expect(confirmation).to start_with 'Placed Banana Juice'
    item.finish
  end
end
