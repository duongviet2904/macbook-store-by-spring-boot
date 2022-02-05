package com.devpro.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.entities.Category;

@Repository // -> Bean
			// -> Dùng connection tới database.
public interface CategoryRepo extends JpaRepository<Category, Integer> {
	
}

