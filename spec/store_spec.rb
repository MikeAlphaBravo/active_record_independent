require('spec_helper')

describe(Store) do
  it { should have_many(:shoes)}

  it("ensures the length of name is at most 100 characters") do
    store = Store.new({:name => "a".*(101)})
    expect(store.save()).to(eq(false))
  end

  it("ensures that name doesn't already exist") do
    Store.create({:name => 'Jim\'s Shoes'})
    store = Store.new({:name => 'Jim\'s Shoes'})
    expect(store.save()).to(eq(false))
  end

  # it('will capitalize name') do
  #   store = Store.create({:name => 'croc larkins'})
  #   expect(store.name).to(eq('Croc Larkins'))
  # end
end
