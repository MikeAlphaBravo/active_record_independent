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

post('/search/shoe') do
  search = params['search']
  result = Shoe.where("brand ILIKE ?", "%#{params['search']}%")
  if result[0]
    redirect("/shoe/#{result[0].id}")
  else
    redirect('/')
  end
end

post('/search/store') do
  search = params['search']
  result = Store.where("name ILIKE ?", "%#{params['search']}%")
  if result[0]
    redirect("/store/#{result[0].id}")
  else
    redirect('/')
  end
end

#SHOE#######################
get('/shoe/create') do
  @stores = Store.all
  erb(:create_shoe)
end

post('/shoe/create') do
  store_ids = params['store_ids']
  brand = params['brand']
  price = params['price']
  if Shoe.create({:store_ids => store_ids, :brand => brand, :price => price})
    redirect('/')
  else
    @not_saved = true
    @stores = Store.all
    erb(:create_shoe)
  end
end

get('/shoe/:id') do
  @shoe = Shoe.find(params['id'])
  erb(:shoe)
end

get('/shoe/edit/:id') do
  @shoe = Shoe.find(params['id'])
  @stores = Store.all
  Shoe.find(params['id'])
  erb(:edit_shoe)
end

post('/shoe/edit/:id') do
  store_ids = params['store_ids']
  brand = params['brand']
  Shoe.update({:store_ids => store_ids, :brand => brand})
  redirect('/')
end

get('/shoe/delete/:id') do
  Shoe.find(params['id']).destroy
  redirect('/')
end

#STORE#######################
get('/store/create') do
  @shoes = Shoe.all
  erb(:create_store)
end

post('/store/create') do
  shoe_ids = params['shoe_ids']
  name = params['name']
  if Store.create({:shoe_ids => shoe_ids, :name => name})
    redirect('/')
  else
    @not_saved = true
    @shoes = Shoe.all
    erb(:create_store)
  end
end

get('/store/:id') do
  @store = Store.find(params['id'])
  erb(:store)
end

get('/store/edit/:id') do
  @store = Store.find(params['id'])
  @shoes = Shoe.all
  Store.find(params['id'])
  erb(:edit_store)
end

post('/store/edit/:id') do
  shoe_ids = params['shoe_ids']
  name = params['name']
  Store.update({:shoe_ids => shoe_ids, :name => name})
  redirect('/')
end

get ('/store/delete/:id') do
  Store.find(params['id']).destroy
  redirect('/')
end
