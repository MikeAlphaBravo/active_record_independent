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

#SHOE#######################
get('/shoe/create') do
  @stores = Store.all
  erb(:create_shoe)
end

post('/shoe/create') do
  store_ids = params['store_ids']
  brand = params['brand']
  Shoe.create({:store_ids => store_ids, :brand => brand})
  redirect('/')
end









#STORE#######################
