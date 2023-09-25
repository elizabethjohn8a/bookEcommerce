package com.Ecommerce.bookEcommerce.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Ecommerce.bookEcommerce.common.ApiResponse;
import com.Ecommerce.bookEcommerce.dto.BookDto;
import com.Ecommerce.bookEcommerce.model.Book;
import com.Ecommerce.bookEcommerce.model.Category;
import com.Ecommerce.bookEcommerce.repository.CategoryRepo;
import com.Ecommerce.bookEcommerce.service.BookService;





@Controller
@RequestMapping("/admin/book")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class BookController {
	@Autowired
    BookService bookService;

    @Autowired
    CategoryRepo categoryRepo;
    
    @GetMapping("/create")
    public String createBook(Model model){
    	model.addAttribute("categoryList", categoryRepo.findAll());  
    	model.addAttribute("model",new BookDto());
    	model.addAttribute("action","create");
        return "admin/book/create";
    }
   
    @PostMapping("/create")
    public String createBook(BookDto bookDto,Model model){    	
        Optional<Category> optionalCategory = categoryRepo.findById(bookDto.getCategoryId());
        bookService.createBook(bookDto, optionalCategory.get());
        return getBooks("",model);
    }

    @GetMapping("")
    public String getBooks(@RequestParam(name = "key", defaultValue = "") String keyword, Model model){
    	
		model.addAttribute("categoryList", categoryRepo.findAll());
		model.addAttribute("key", keyword);
    	model.addAttribute("data", bookService.getAllBooks(keyword));
        return "admin/book/index";

    }

    @GetMapping("/update/{bookId}")
    public String  updateBook(@PathVariable("bookId") Integer bookId,Model model) throws Exception {
        try {
        	model.addAttribute("categoryList", categoryRepo.findAll());  
        	Book book=bookService.findById(bookId);
        	BookDto bookDto=bookService.getBookDto(book);
        	model.addAttribute("action", "update");
        	model.addAttribute("model", bookDto);
        	
        	return "admin/book/create";
		} catch (Exception e) {
			return "error/404";
		}
    	
    }

    @PostMapping("/update/{bookId}")
    public String updateBook(@PathVariable("bookId") Integer bookId, BookDto bookDto,Model model) throws Exception {
        try {
        	Optional<Category> optionalCategory = categoryRepo.findById(bookDto.getCategoryId());
            if(!optionalCategory.isPresent()){
            	System.out.println("null cateory");
                return "error/500";
            }
            
            bookService.updateBook(bookDto, bookId);
            Book book=bookService.findById(bookId);
        	bookDto=bookService.getBookDto(book);
        	model.addAttribute("action", "update");
        	model.addAttribute("model",bookDto);
        	model.addAttribute("categoryList", categoryRepo.findAll());
        	return "admin/book/create";
		} catch (Exception e) {		
			
			 return "error/500";
		}
    }

    @GetMapping("/delete/{bookId}")
    public String deleteCartItem(@PathVariable("bookId") Integer bookId,Model model){
        try {
        	bookService.deleteBookById(bookId);
        	 return getBooks("",model);
		} catch (Exception e) {
			model.addAttribute("errorMessage", e.getMessage());
            return "error/500";	
		}
    }
}
