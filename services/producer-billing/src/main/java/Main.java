package main.java;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

public class Main {
    
    @Path("/hello")
    public String hello() {
        return "Hello, World!";
    }
}
