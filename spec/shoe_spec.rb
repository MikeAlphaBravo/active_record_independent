require('spec_helper')

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

  # it('will capitalize name') do
  #   shoe = Shoe.create({:brand => 'croc larkins'})
  #   expect(shoe.brand).to(eq('Croc Larkins'))
  # end
end
