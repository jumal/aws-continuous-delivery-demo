package org.jumaland;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RestaurantRepository extends MongoRepository<Restaurant, String> {

    List<Restaurant> findByCuisine(@Param("type") String cuisine);
}