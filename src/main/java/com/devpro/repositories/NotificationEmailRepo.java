package com.devpro.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.entities.NotificationEmail;

@Repository
public interface NotificationEmailRepo extends JpaRepository<NotificationEmail, Integer> {

}
