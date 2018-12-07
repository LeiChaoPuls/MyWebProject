package cn.book.service.books;

import java.util.List;

import cn.book.pojo.Books;

public interface BooksService {

	
	//根据书名查
	public List<Books> findBookList(String bookName,String bookAuthor,String bookPublish,
								   Integer currentPageNo,
								   Integer pageSize);
	public int findCount(String bookName,String bookAuthor,String bookPublish);
	
	public int addBook(Books book);
}
