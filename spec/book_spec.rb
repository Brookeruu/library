require ('spec_helper')

describe(Book) do
  describe('#==') do
    it('is the same book if it has the same title') do
      book1 = Book.new({:title => "Silmarillion", :id => nil})
      book2 = Book.new({:title => "Silmarillion", :id => nil})
      expect(book1).to(eq(book2))
    end
  end

  describe(".all") do
    it('starts without any books') do
      # book1 = Book.new({:title => "Silmarillion"})
      expect(Book.all).to(eq([]))
    end
  end

  describe('#title') do
    it('tell you book title') do
      book = Book.new({:title => "Silmarillion", :id => nil})
      book.save
      expect(Book.title).to(eq("Silmarillion"))
    end
  end

  describe("#id") do
    it('assign book ID when saved') do
      book = Book.new({:title => "Silmarillion", :id => nil})
      book.save
      expect(book.id).to(to_be_an_instance_of(Integer))
    end
  end

  describe('#save') do
    it('add a book title to book array') do
      book = Book.new({:title => "Hobbit", :id => nil})
      book.save
      expect(Book.all).to(eq([book]))
    end
  end




end
