package org.jumaland;

import java.util.List;

public class Address {

    private String street;
    private String zipcode;
    private String building;
    private List<Double> coord;

    public String getStreet() {
        return street;
    }

    public String getZipcode() {
        return zipcode;
    }

    public String getBuilding() {
        return building;
    }

    public List<Double> getCoord() {
        return coord;
    }

    private Address() {
        super();
    }

    public Address(String street, String zipcode, String building, List<Double> coord) {
        this();
        this.street = street;
        this.zipcode = zipcode;
        this.building = building;
        this.coord = coord;
    }
}
