require 'spec_helper'

describe(Patron) do

  describe('.all') do
    it('starts without any patrons') do
      expect(Patron.all).to(eq([]))
    end
  end

  describe('#name') do
    it('tell you patron name') do
      patron = Patron.new({:name => "Gus"})
      expect(Patron.name).to(eq("Gus"))
    end
  end

  describe('#id') do
    it('set patron ID when saved') do
      patron = Patron.new({:name => "Gus", :id => nil})
      patron.save
      expect(patron.id).to(to_be_an_instance_of(Integer))
    end
  end

  describe('#save') do
    it('lets you save patrons to the database') do
      patron = Patron.new({:name => "Gus", :id => nil})
      patron.save
      expect(Patron.all).to(eq([patron]))
    end
  end

  describe("#==") do
  it("is the same patron if it has the same name") do
    patron1 = Patron.new({:name => "Gus", :id => nil})
    patron2 = Patron.new({:name => "Gus", :id => nil})
    expect(patron1).to(eq(patron2))
  end
end

end
