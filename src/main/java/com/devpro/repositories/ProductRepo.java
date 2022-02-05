package com.devpro.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.entities.Product;

@Repository // -> Bean
			// -> Dùng connection tới database.
public interface ProductRepo extends JpaRepository<Product, Integer> {

}
