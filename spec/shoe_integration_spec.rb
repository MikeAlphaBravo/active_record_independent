require("spec_helper")
require("./app")
Capybara.app = Sinatra::application
set(:show_exceptions, false)
