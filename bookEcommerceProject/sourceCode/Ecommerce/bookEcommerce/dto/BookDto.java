package com.Ecommerce.bookEcommerce.dto;

import javax.validation.constraints.NotNull;

public class BookDto {
    private Integer id;
    private @NotNull String name;
    private @NotNull String imageURL;
    private @NotNull int price;
    private @NotNull String description;
    private @NotNull Integer categoryId;

    public BookDto() {
    }
    

    public BookDto(Integer id, @NotNull String name, @NotNull String imageURL, @NotNull int price,
			@NotNull String description, @NotNull Integer categoryId) {
		super();
		this.id = id;
		this.name = name;
		this.imageURL = imageURL;
		this.price = price;
		this.description = description;
		this.categoryId = categoryId;
	}


	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
}
