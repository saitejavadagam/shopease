package com.zeptoneon.backend.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.zeptoneon.backend.dto.ProductPageResponse;
import com.zeptoneon.backend.dto.ProductResponse;
import com.zeptoneon.backend.entity.Product;
import com.zeptoneon.backend.repository.ProductRepository;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;

    public ProductPageResponse getProducts(String search,String category,String subcategory, int page, int size)
    {
        Pageable pageable = PageRequest.of(page, size);

        Page<Product> productPage;

        boolean hasSearch = search != null && !search.isBlank();
        boolean hasCategory = category != null && !category.isBlank();
        boolean hasSubcategory = subcategory != null && !subcategory.isBlank();

        if (hasCategory && hasSubcategory && hasSearch) {
            productPage = productRepository.findByCategoryIgnoreCaseAndSubcategoryIgnoreCaseAndTitleContainingIgnoreCase(
                    sanitizeString(category), sanitizeString(subcategory), search.trim(), pageable);
        }

        else if (hasCategory && hasSubcategory) {
            productPage = productRepository.findByCategoryIgnoreCaseAndSubcategoryIgnoreCase(
                    sanitizeString(category), sanitizeString(subcategory), pageable);
        }

        else if (hasCategory && hasSearch) {
            productPage = productRepository.findByCategoryIgnoreCaseAndTitleContainingIgnoreCase(
                    sanitizeString(category), search.trim(), pageable);
        }

        else if (hasSearch) {
            productPage = productRepository.findByTitleContainingIgnoreCase(search.trim(), pageable);
        }

        else if (hasCategory) {
            productPage = productRepository.findByCategoryIgnoreCase(sanitizeString(category), pageable);
        }

        else {
            productPage = productRepository.findAll(pageable);
        }

        Page<ProductResponse> responsePage = productPage.map(this::mapToResponse);

        return new ProductPageResponse(
                responsePage.getContent(),
                responsePage.getNumber(),
                responsePage.getTotalPages(),
                responsePage.getTotalElements()
        );
    }

    private String sanitizeString(String string) {
        return string.trim()
                .toLowerCase()
                .replace(" & ", "-")
                .replace(" ", "-");
    }

    public ProductResponse getProductById(Long id) {
        Product product =  productRepository.findById(id)
                .orElseThrow(()-> new RuntimeException("Product not found"));

        return mapToResponse(product);
    }

    private ProductResponse mapToResponse(Product product) {
        return ProductResponse.builder()
                .id(product.getId())
                .title(product.getTitle())
                .price(product.getPrice())
                .mrp(product.getMrp())
                .rating(product.getRating())
                .reviews(product.getReviews())
                .bought(product.getBought())
                .sponsored(product.getSponsored())
                .image(product.getImage())
                .build();
    }



}
