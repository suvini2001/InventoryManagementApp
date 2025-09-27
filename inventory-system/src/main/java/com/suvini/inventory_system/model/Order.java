package com.yourname.inventory.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * Order entity mapped to SQL table "ORDERS"
 */
@Entity
@Table(name = "ORDERS")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "OrderID")
    private Long orderId;

    // Maps to DATETIME default CURRENT_TIMESTAMP in SQL.
    // We'll set the value when persisting if not provided.
    @Column(name = "OrderDate", nullable = false)
    private LocalDateTime orderDate;

    @Column(name = "Order_Status", length = 20)
    private String orderStatus;

    @Column(name = "Customer_Info", length = 100)
    private String customerInfo;

    // One order -> many OrderItem rows (junction table)
    // Cascade.ALL because when you save/remove an Order you usually want to cascade to its OrderItems.
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private List<OrderItem> orderItems = new ArrayList<>();

    // If OrderDate is not set from code, set it just before insert.
    @PrePersist
    public void prePersist() {
        if (this.orderDate == null) {
            this.orderDate = LocalDateTime.now();
        }
        if (this.orderStatus == null) {
            this.orderStatus = "Pending";
        }
    }
}
