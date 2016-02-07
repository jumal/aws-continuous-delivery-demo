package org.jumaland;

import java.util.List;

public class Restaurant {

    private String id;
    private String name;
    private Address address;
    private String borough;
    private String cuisine;
    private List<Grade> grades;

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Address getAddress() {
        return address;
    }

    public String getBorough() {
        return borough;
    }

    public String getCuisine() {
        return cuisine;
    }

    public List<Grade> getGrades() {
        return grades;
    }

    private Restaurant() {
        super();
    }

    public Restaurant(String name, Address address, String borough, String cuisine, List<Grade> grades) {
        this();
        this.name = name;
        this.address = address;
        this.borough = borough;
        this.cuisine = cuisine;
        this.grades = grades;
    }
}
