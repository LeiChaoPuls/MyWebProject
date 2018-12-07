package cn.book.service.books;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.book.dao.books.BooksMapper;
import cn.book.pojo.Books;

@Service
public class BooksServiceImpl implements BooksService {

	@Resource
	private BooksMapper bookMapper;
	
	
	@Override
	public List<Books> findBookList(String bookName, String bookAuthor,
			String bookPublish, Integer currentPageNo, Integer pageSize) {
		//将页码转换为下标
				int index = (currentPageNo - 1) * pageSize;
				List<Books> userList = bookMapper.getBookList(bookName, bookAuthor, bookPublish, index, pageSize);
				return userList;
	}
	
	
	@Override
	public int findCount(String bookName,String bookAuthor,String bookPublish) {
		return bookMapper.getCount(bookName, bookAuthor, bookPublish);
	}
	
	@Override
	public int addBook(Books book) {
		return bookMapper.addBook(book);
	}

	
	

}
