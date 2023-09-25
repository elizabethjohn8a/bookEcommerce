package com.Ecommerce.bookEcommerce.repository;

import com.Ecommerce.bookEcommerce.model.Book;
import com.Ecommerce.bookEcommerce.model.Category;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Integer> {
	List<Book> findByNameContainsOrderByIdDesc(String name);

	List<Book> findByCategory(Category category);
}
