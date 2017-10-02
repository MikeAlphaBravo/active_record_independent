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

describe('updating a shoe', {:type => :feature}) do
  it('allows a user to update a shoe brand and titlecase') do
    shoe = Shoe.create(:brand => 'Crocs')
    visit ('/')
    click_link ('edit')
    fill_in('brand', :with => 'boggs')
    click_button('Create!')
    expect(page).to have_content('Boggs')
  end
end

describe('delete a shoe', {:type => :feature}) do
  it('allows a user to delete a shoe brand') do
    Shoe.create(:brand => 'Crocs')
    visit('/')
    click_link('delete')
    expect(page).not_to have_content('Crocs')
  end
end
