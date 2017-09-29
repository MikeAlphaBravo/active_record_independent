require("bundler/setup")
require("sinatra/activerecord")
require("pry")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/')do
  @shoes = Shoe.all
  @stores = Store.all
  erb(:index)
end
