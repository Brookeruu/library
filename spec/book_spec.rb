require ('spec_helper')

describe(Book) do
  describe('#==') do
    it('is the same book if it has the same title') do
      book1 = Book.new({:title => "Silmarillion"})
      book2 = Book.new({:title => "Silmarillion"})
      expect(book1).to(eq(book2))
    end
  end
end
