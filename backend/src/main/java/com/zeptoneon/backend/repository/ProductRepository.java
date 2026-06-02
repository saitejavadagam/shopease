package com.zeptoneon.backend.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.zeptoneon.backend.entity.Product;


public interface ProductRepository extends JpaRepository<Product, Long> {
    Page<Product> findByTitleContainingIgnoreCase(String title, Pageable pageable);
    Page<Product> findByCategoryIgnoreCase(String category, Pageable pageable);
    Page<Product> findByCategoryIgnoreCaseAndTitleContainingIgnoreCase(String category, String search, Pageable pageable);
    Page<Product> findByCategoryIgnoreCaseAndSubcategoryIgnoreCase(String category, String subCategory, Pageable pageable);
    Page<Product> findByCategoryIgnoreCaseAndSubcategoryIgnoreCaseAndTitleContainingIgnoreCase(String category, String subCategory, String search, Pageable pageable);
}
