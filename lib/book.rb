class Book

  attr_reader :title, :id

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def self.all
    all_books = DB.exec('SELECT * FROM books;')
      books_array = []
      all_books.each do |book|
        title = book.fetch("title")
        id = book.fetch("id").to_i
        books_array.push(Book.new({:title => title}, :id => id))
      end
    books_array
  end

  def save
      result = DB.exec("INSERT INTO books (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  def ==(another_book)
    self.title.==(another_book.title).&(self.id.==(another_book.id))
  end

end
