require("spec_helper")
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new shoe', {:type => :feature}) do
  it('allows a user to add a shoe') do
    visit('/')
    click_link('Add a Shoe')
    fill_in('brand', :with => 'nike')
    click_button('Create!')
    visit('/')
    expect(page).to have_content('Nike')
  end
end

describe('adding a new store', {:type => :feature}) do
  it('allows a user to add a store') do
    visit('/')
    click_link('Add a Retailer')
    fill_in('name', :with => 'bobby brands')
    click_button('Create!')
    visit('/')
    expect(page).to have_content('Bobby Brands')
  end
end
