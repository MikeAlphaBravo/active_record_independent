require('spec_helper')
require('rspec')

describe(Shoe) do
  it { should have_many(:stores)}

  it("ensures the length of brand is at most 100 characters") do
    shoe = Shoe.new({:brand => "a".*(101)})
    expect(shoe.save()).to(eq(false))
  end

  it("ensures that brand doesn't already exist") do
    Shoe.create({:brand => 'Croc Larkins'})
    shoe = Shoe.new({:brand => 'croc larkins'})
    expect(shoe.save()).to(eq(false))
  end

  it('capitalizes the title') do
    shoe = Shoe.new({:brand => 'test'})
    shoe.save()
    expect(shoe.brand).to(eq('Test'))
  end
end
