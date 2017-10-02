require("spec_helper")
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

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

describe('updating a store', {:type => :feature}) do
  it('allows a user to update a store name and titlecase') do
    store = Store.create(:name => 'Biggies')
    visit ('/')
    click_link ('edit')
    fill_in('name', :with => 'biggies')
    click_button('Create!')
    expect(page).to have_content('Biggies')
  end
end

describe('delete a store', {:type => :feature}) do
  it('allows a user to delete a store name') do
    Store.create(:name => 'Foot Locker')
    visit('/')
    click_link('delete')
    expect(page).not_to have_content('Foot Locker')
  end
end
