class Book

  attr_reader :title

  def initialize(attributes)
    @title = attributes.fetch(:title)
  end

  def self.all
    all_books = DB.exec('SELECT * FROM books;')
      books_array = []
      all_books.each do |book|
        title = book.fetch("title")
        books_array.push(Book.new({:title => title}))
      end
    books_array
  end

  def save
    DB.exec("INSERT INTO books (title) VALUES ('#{@title}');")
  end

  def ==(another_book)
    self.title.==(another_book.title)
  end

end
