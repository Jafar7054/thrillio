package com.semanticsquare.thrillio.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Books {
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
private Long id;
private Long User_id;
private String url;
private String title;
private String book_genre;
}
