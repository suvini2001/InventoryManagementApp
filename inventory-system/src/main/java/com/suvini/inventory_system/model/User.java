package com.yourname.inventory.model;

import jakarta.persistence.*;
import lombok.*;

/**
 * User entity for USERS table
 * Note: passwords should be stored hashed in production (bcrypt/argon2), not plain text.
 */
@Entity
@Table(name = "USERS")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long userId;

    @Column(name = "username", nullable = false, unique = true, length = 50)
    private String username;

    // store the hashed password here. length 255 to be safe for hashed values
    @Column(name = "user_password", nullable = false, length = 255)
    private String userPassword;

    @Column(name = "role_of_user", nullable = false, length = 50)
    private String roleOfUser;
}
