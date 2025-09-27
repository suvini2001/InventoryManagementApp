/**
 * Supplier entity mapped to SQL table "Suppliers"
 */

package com.suvini.inventory_system.model;  //package declaration to specify the package name and organize the class within a namespace

//List is the interface type used for the items field;
// ArrayList is the concrete class used to initialize it.
import java.util.List;  
import java.util.ArrayList;

/*importing all classes from the jakarta.persistence package for JPA annotations
It allows you to map Java objects (classes) to database tables and handle queries without writing raw SQL for everything.

You can use:
@Entity → Marks a class as a database entity (table).
@Table → Specifies the database table name.
@Id → Marks the primary key field.
@GeneratedValue → Tells JPA how to generate the primary key (auto-increment, sequence, etc.).
@Column → Maps a field to a specific database column.
@OneToMany, @ManyToOne, @ManyToMany, @OneToOne → Define relationships between entities.
EntityManager → Provides APIs to query and manage entities. */

import jakarta.persistence.*;  
import lombok.* //Lombok library to reduce boilerplate code for getters, setters, toString, etc.

@Entity //Specifies that the class is an entity and is mapped to a database table.
@Table(name = "Suppliers") //Specifies the name of the database table to be used for mapping.
@Data //Generates getters, setters, toString, equals, and hashCode methods.
@NoArgsConstructor //Generates a no-argument constructor.
@AllArgsConstructor //Generates a constructor with 1 parameter for each field in the class.
Builder //Implements the builder pattern for the class.
public class Suppliers {


    @Id //Specifies the primary key of an entity.
    @GeneratedValue(strategy = GenerationType.IDENTITY) //Specifies how the primary key should be generated.The database will automatically generate a unique value for this field when a new record is inserted.
    @Column(name = "SupplierID") //Maps the field to the specified column in the database table.
    private int supplierID;

    //first name column :FName VARCHAR(50 ) NOT NULL,
    @Column(name = "FName", nullable = false, length = 50)
    private String firstName;

    //last name column :LName VARCHAR(50 ) NOT NULL,
    @Column(name = "LName", nullable = false, length = 50)
    private String lastName;

    //Email column :Email VARCHAR(100 ) UNIQUE NOT NULL,
    @Column(name = "Email", nullable = false, unique = true, length =100)
    private String email;

    //Phone column :Phone VARCHAR(15 ) UNIQUE NOT NULL,
    @Column(name = "Tel_No", nullable = false, unique = true, length = 15)  
    private String telNo;

    //Bi-directional 1:M relationship with Items
    // mappedBy = "supplier" means the Item entity owns the FK column.
    @OneToMany(mappedBy = "supplier",fetch = FetchType.LAZY)
    @ToString.Exclude //Excludes this field from the generated toString() method to prevent recursion.
    @EqualsAndHashCode.Exclude //Excludes this field from equals() and hashCode() methods to avoid potential issues with collections.
    private List<Items> items;