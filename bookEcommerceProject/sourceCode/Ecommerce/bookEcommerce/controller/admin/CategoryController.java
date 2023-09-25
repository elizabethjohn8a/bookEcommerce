package com.Ecommerce.bookEcommerce.controller.admin;

import com.Ecommerce.bookEcommerce.common.ApiResponse;
import com.Ecommerce.bookEcommerce.dto.BookDto;
import com.Ecommerce.bookEcommerce.model.Book;
import com.Ecommerce.bookEcommerce.model.Category;
import com.Ecommerce.bookEcommerce.repository.CategoryRepo;
import com.Ecommerce.bookEcommerce.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("admin/category")
public class CategoryController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	CategoryRepo categoryRepo;

	@GetMapping("/create")
	public String createCategory(Model model) {
		model.addAttribute("model", new Category());
		model.addAttribute("action", "create");
		return "admin/category/create";
	}

	@PostMapping("/create")
	public String createCategory(Category category, Model model) {
		categoryService.createCategory(category);
		return listCategory(model);
	}

	@GetMapping()
	public String listCategory(Model model) {
		model.addAttribute("categories", categoryService.listCategory());
		return "admin/category/index";
	}

	@GetMapping("/update/{id}")
	public String updateBook(@PathVariable("id") Integer id, Model model) throws Exception {

		try {
			if (!categoryService.findById(id))
				return "error/404";

			Category category = categoryRepo.findById(id).get();
			model.addAttribute("action", "update");
			model.addAttribute("model", category);

			return "admin/category/create";
		} catch (Exception e) {
			return "error/404";
		}

	}

	@PostMapping("/update/{id}")
	public String updateCategory(@PathVariable("id") int id,  Category category, Model model) {
//		model.addAttribute("action", "create");
		if (!categoryService.findById(id))
			return "error/404";
		categoryService.editCategory(id, category);
		return listCategory(model);
	}

	@DeleteMapping("/delete/{categoryId}")
	public ResponseEntity<ApiResponse> deleteCartItem(@PathVariable("categoryId") Integer categoryId) {
		categoryService.deleteCategoryById(categoryId);
		return new ResponseEntity<>(new ApiResponse(true, "Book has been deleted!"), HttpStatus.OK);
	}

}
