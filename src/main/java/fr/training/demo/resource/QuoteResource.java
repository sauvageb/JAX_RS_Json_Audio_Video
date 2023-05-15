package fr.training.demo.resource;

import fr.training.demo.model.Quote;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.Arrays;
import java.util.List;

@Path("/quotes")
public class QuoteResource {

    private static Long idSequence = 0L;
    public static List<Quote> quotes = Arrays.asList(
            new Quote(++idSequence, "Le courage n'est pas l'absence de peur, mais la capacité de vaincre ce qui fait peur"),
            new Quote(++idSequence, "Celui qui accepte le mal sans lutter contre lui coopère avec lui."),
            new Quote(++idSequence, "À vaincre sans péril, on triomphe sans gloire.")
    );

    @GET
    @Produces(value = MediaType.APPLICATION_JSON)
    public Response getAll() {
        return Response.ok(quotes).build();
    }

    @POST
    @Consumes(value = MediaType.APPLICATION_JSON)
    @Produces(value = MediaType.APPLICATION_JSON)
    public Response createQuote(Quote quote) {
        quote.setId(idSequence);
        quotes.add(quote);
        return Response
                .status(Response.Status.CREATED)
                .entity(quotes)
                .build();
    }


}
