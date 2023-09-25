package com.Ecommerce.bookEcommerce.service;

import com.Ecommerce.bookEcommerce.dto.BookDto;
import com.Ecommerce.bookEcommerce.exceptions.BookNotExsistException;
import com.Ecommerce.bookEcommerce.model.Book;
import com.Ecommerce.bookEcommerce.model.Cart;
import com.Ecommerce.bookEcommerce.model.Category;
import com.Ecommerce.bookEcommerce.model.OrderItem;
import com.Ecommerce.bookEcommerce.model.WishList;
import com.Ecommerce.bookEcommerce.repository.BookRepository;
import com.Ecommerce.bookEcommerce.repository.CartRepository;
import com.Ecommerce.bookEcommerce.repository.CategoryRepo;
import com.Ecommerce.bookEcommerce.repository.OrderItemsRepository;
import com.Ecommerce.bookEcommerce.repository.WishListRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class BookService {
	@Autowired
	BookRepository bookRepository;
	@Autowired
	WishListRepository wishlistRepository;
	@Autowired
	OrderItemsRepository orderItemRepository;
	@Autowired
	CartRepository cartRepository;
	@Autowired
	 CategoryRepo categoryRepo;

	public void createBook(BookDto bookDto, Category category) {
		Book book = new Book();
		book.setDescription(bookDto.getDescription());
		book.setImageURL(bookDto.getImageURL());
		book.setName(bookDto.getName());
		book.setCategory(category);
		book.setPrice(bookDto.getPrice());
		bookRepository.save(book);

	}

	public BookDto getBookDto(Book book) {
		BookDto bookDto = new BookDto();
		bookDto.setDescription(book.getDescription());
		bookDto.setImageURL(book.getImageURL());
		bookDto.setName(book.getName());
		bookDto.setCategoryId(book.getCategory().getId());
		bookDto.setPrice(book.getPrice());
		bookDto.setId(book.getId());
		return bookDto;
	}
	public boolean isDeletable(Book book) {
	    // check if the book is in any wishlist
	    List<WishList> wishlists = wishlistRepository.findByBook(book);
	    if (!wishlists.isEmpty()) {
	      return false;
	    }

	    // check if the book is in any order
	    List<OrderItem> orderItems = orderItemRepository.findByBook(book);
	    if (!orderItems.isEmpty()) {
	      return false;
	    }

	    // check if the book is in any cart
	    List<Cart> carts = cartRepository.findByBook(book);
	    if (!carts.isEmpty()) {
	      return false;
	    }

	    // if none of the above conditions are true, the book is deletable
	    return true;
	  }
	public List<Book> getAllBooks(String keyword) {
		if (keyword.isEmpty()) {
			return bookRepository.findAll(Sort.by(Sort.Direction.DESC, "id"));
		} else {
			return bookRepository.findByNameContainsOrderByIdDesc(keyword);
		}
	}

	public List<Book> showLastedProducts() {

		return bookRepository.findAll(PageRequest.of(0, 10, Sort.by(Sort.Direction.DESC, "id"))).toList();

	}

	public void updateBook(BookDto bookDto, Integer bookId) throws Exception {
		Optional<Book> optionalBook = bookRepository.findById(bookId);

		if (!optionalBook.isPresent()) {
			throw new Exception("book is not present.");
		}
		Book book = optionalBook.get();
		book.setDescription(bookDto.getDescription());
		book.setImageURL(bookDto.getImageURL());
		book.setName(bookDto.getName());
		book.setPrice(bookDto.getPrice());
		book.setId(bookDto.getId());
		book.setCategory(categoryRepo.findById(bookDto.getCategoryId()).get());
		bookRepository.save(book);
	}

	public Book findById(Integer bookId) throws BookNotExsistException {
		Optional<Book> optionalBook = bookRepository.findById(bookId);
		if (optionalBook.isEmpty()) {
			throw new BookNotExsistException("Book is not invalid: " + bookId);
		}
		return optionalBook.get();
	}

	public void deleteBookById(Integer bookId) {
		Book book=findById(bookId);
		if (isDeletable(book)) {
			throw new BookNotExsistException("Book cannot delete book cause it being used: " );
		}else {
			bookRepository.delete(book);
		}
	}
}
