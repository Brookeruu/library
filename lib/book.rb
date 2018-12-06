class Book

  attr_reader :title

  def initialize(attributes)
    @title = attributes.fetch(:title)
  end

  def self.all
    returned_books = DB.exec('SELECT * FROM books;')
      books = []
      returned_books.each do |book|
        title.fetch("title")
        books.push(Book.new({:title => title}))
    end
    books
  end

  def ==(another_book)
    self.title.==(another_book.title)
  end

end
