package cn.book.dao.books;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.book.pojo.Books;

public interface BooksMapper {
	
	//根据条件查询
	public List<Books> getBookList(@Param("bookName") String bookName,
								  @Param("bookAuthor")String bookAuthor,
								  @Param("bookPublish")String bookPublish,
								  @Param("index") Integer index,
								  @Param("pageSize") Integer pageSize);
	//根据条件查询记录数
	public int getCount(@Param("bookName") String bookName,
						@Param("bookAuthor")String bookAuthor,
						@Param("bookPublish")String bookPublish);
	
	//添加图书
	public int addBook(Books book);
	
	
}
