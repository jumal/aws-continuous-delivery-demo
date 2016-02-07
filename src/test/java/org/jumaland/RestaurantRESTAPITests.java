package org.jumaland;

import com.lordofthejars.nosqlunit.annotation.ShouldMatchDataSet;
import com.lordofthejars.nosqlunit.annotation.UsingDataSet;
import com.lordofthejars.nosqlunit.mongodb.MongoDbRule;
import org.apache.commons.io.IOUtils;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.boot.test.TestRestTemplate;
import org.springframework.boot.test.WebIntegrationTest;
import org.springframework.context.ApplicationContext;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.hateoas.client.Traverson;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.util.Collection;

import static com.lordofthejars.nosqlunit.core.LoadStrategyEnum.CLEAN_INSERT;
import static com.lordofthejars.nosqlunit.mongodb.MongoDbRule.MongoDbRuleBuilder.newMongoDbRule;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.springframework.hateoas.MediaTypes.HAL_JSON;
import static org.springframework.hateoas.client.Traverson.getDefaultMessageConverters;
import static org.springframework.http.HttpMethod.*;
import static org.springframework.http.MediaType.APPLICATION_JSON_UTF8;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebIntegrationTest
public class RestaurantRESTAPITests {

    private static final URI ROOT_URI = URI.create("http://127.0.0.1:8080");
    private static final RestTemplate TEMPLATE = new TestRestTemplate();
    static {
        TEMPLATE.setMessageConverters(getDefaultMessageConverters(HAL_JSON));
    }
    private static final ResponseType TYPE = new ResponseType();
    private static final CollectionResponseType COLLECTION_TYPE = new CollectionResponseType();

    @Rule
    public MongoDbRule rule = newMongoDbRule().defaultSpringMongoDb("docker-demo");

    @Autowired
    private ApplicationContext applicationContext;

    @Test
    public void discover() {
        assertThat(restaurantsURI(), is(notNullValue()));
    }

    @Test
    @ShouldMatchDataSet(location = "initial-data.json")
    public void create() throws Exception {
        String json = IOUtils.toString(getClass().getResourceAsStream("create-initial-data.json"));
        Resource<Restaurant> resource = TEMPLATE.exchange(restaurantsURI(), POST, entity(json), TYPE).getBody();
        assertThat(resource.getLink("self").getHref(), is(notNullValue()));
    }

    @Test
    @UsingDataSet(locations = "initial-data.json", loadStrategy = CLEAN_INSERT)
    public void list() {
        assertThat(restaurants().size(), is(1));
    }

    @Test
    @UsingDataSet(locations = "initial-data.json", loadStrategy = CLEAN_INSERT)
    @ShouldMatchDataSet(location = "update-expected-data.json")
    public void update() {
        TEMPLATE.exchange(restaurantURI(), PATCH, entity("{\"cuisine\":\"French\"}"), Void.class);
    }

    @Test
    @UsingDataSet(locations = "initial-data.json", loadStrategy = CLEAN_INSERT)
    public void searchByCuisine() {
        String uri = new Traverson(ROOT_URI, HAL_JSON).follow("restaurants", "search", "findByCuisine")
                .asTemplatedLink().expand("Italian").getHref();
        Resources<Resource<Restaurant>> resources = TEMPLATE.exchange(uri, GET, null, COLLECTION_TYPE).getBody();
        assertThat(resources.getContent().size(), is(1));
    }

    @Test
    @UsingDataSet(locations = "initial-data.json", loadStrategy = CLEAN_INSERT)
    @ShouldMatchDataSet(location = "delete-expected-data.json")
    public void delete() {
        TEMPLATE.delete(restaurantURI());
    }

    private static String restaurantsURI() {
        return new Traverson(ROOT_URI, HAL_JSON).follow("restaurants").asLink().getHref();
    }

    private static Collection<Resource<Restaurant>> restaurants() {
        return TEMPLATE.exchange(restaurantsURI(), GET, null, COLLECTION_TYPE).getBody().getContent();
    }

    private static String restaurantURI() {
        return restaurants().stream().findFirst().get().getLink("self").getHref();
    }

    private static HttpEntity<String> entity(final String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(APPLICATION_JSON_UTF8);
        return new HttpEntity<>(json, headers);
    }

    private static class ResponseType extends ParameterizedTypeReference<Resource<Restaurant>> {}
    private static class CollectionResponseType extends ParameterizedTypeReference<Resources<Resource<Restaurant>>> {}
}
