package com.yourname.inventory.model;

import jakarta.persistence.*;
import lombok.*;

/**
 * Item entity mapped to SQL table "ITEMS"
 */
@Entity
@Table(name = "ITEMS")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Item {

    // Primary key (ItemID INT AUTO_INCREMENT PRIMARY KEY)
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ItemID")
    private Long itemId;

    // Item name column (ItemName VARCHAR(100) NOT NULL)
    @Column(name = "ItemName", nullable = false, length = 100)
    private String itemName;

    // Quantity column (Quantity INT NOT NULL)
    @Column(name = "Quantity", nullable = false)
    private Integer quantity;

    // Price column (Price DECIMAL(10,2))
    @Column(name = "Price", nullable = false, precision = 10, scale = 2)
    private Double price;

    // Category column (Category VARCHAR(50))
    @Column(name = "Category", length = 50)
    private String category;

    // Many-to-one relationship: many Items -> one Supplier
    // nullable = true because your SQL uses ON DELETE SET NULL for SupplierID
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(
        name = "SupplierID",
        foreignKey = @ForeignKey(name = "fk_item_supplier"),
        nullable = true
    )
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private Supplier supplier;
}
