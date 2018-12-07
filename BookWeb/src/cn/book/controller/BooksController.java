package cn.book.controller;

import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.book.pojo.Books;
import cn.book.service.books.BooksService;

@Controller
public class BooksController {
	
	@Resource
	private BooksService bookService;

	@RequestMapping("/booklist")
	public String getUserList(String xuanzhe,String zhi,
							  Integer currentPageNo,
							  Model model){
		String bookName="";
		String bookAuthor="";
		String bookPublish="";
		//定义页面容量
		int pageSize = 3;
		//控制页码以及控制首页
		if(currentPageNo == null || currentPageNo < 1){
			currentPageNo = 1;
		}
		//获取总记录数
		int totalCount =0;
		if(xuanzhe==null){
			xuanzhe="";
		}
		if(xuanzhe.equals("书名")){
			bookName=zhi;
			totalCount= bookService.findCount(bookName, bookAuthor, bookPublish);
		}else if(xuanzhe.equals("作者")){
			bookAuthor=zhi;
			totalCount= bookService.findCount(bookName, bookAuthor, bookPublish);
			
		}else if(xuanzhe.equals("出版社")){
			bookPublish=zhi;
			totalCount= bookService.findCount(bookName, bookAuthor, bookPublish);
			
		}else{
			totalCount= bookService.findCount(bookName, bookAuthor, bookPublish);
		}
		
		//计算总页数
		int totalPageCount = totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize + 1;
		//控制总的页数
		if(totalPageCount < 1){
			totalPageCount = 1;
		}
		//控制尾页
		if(currentPageNo > totalPageCount){
			currentPageNo = totalPageCount;
		}
		List<Books> bookList = bookService.findBookList(bookName, bookAuthor, bookPublish, currentPageNo, pageSize);
		model.addAttribute("bookList",bookList);
		model.addAttribute("zhi",zhi);
		model.addAttribute("currentPageNo",currentPageNo);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("xuanzhe", xuanzhe);
		return "booklist";
	}
	
	//跳转到添加页面
	@RequestMapping("/toAdd")
	public String toAdd(){
		return "addbook";
	}
	
	//添加新书
	@RequestMapping("/addBook")
	public String addBook(Books book){
		book.setCreateDate(new Date());
		if(bookService.addBook(book)>0){
			return "redirect:/booklist";
		}
		return "redirect:/toAdd";
	}
}
