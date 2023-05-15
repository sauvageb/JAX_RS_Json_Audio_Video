package fr.training.demo.resource;

import jakarta.servlet.ServletContext;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.WebApplicationException;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.StreamingOutput;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@Path("audio")
public class AudioResource {

    @GET
    @Produces("audio/mp3")
    public Response getAudio(@Context ServletContext servletContext) {
        // Récupérer le fichier audio à partir du système de fichiers local
        String filePath = servletContext.getRealPath("/WEB-INF/audio.mp3");
        File audioFile = new File(filePath);

        // Vérifier si le fichier existe
        if (!audioFile.exists()) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        // Créer une StreamingOutput pour envoyer le flux audio
        StreamingOutput stream = new StreamingOutput() {
            @Override
            public void write(OutputStream output) throws IOException, WebApplicationException {
                try (FileInputStream inputStream = new FileInputStream(audioFile)) {
                    byte[] buffer = new byte[4096];
                    int bytesRead;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        output.write(buffer, 0, bytesRead);
                    }
                } catch (IOException e) {
                    throw new WebApplicationException("Erreur lors de la récupération du flux audio : " + e.getMessage());
                }
            }
        };

        // Créer une réponse avec la StreamingOutput
        return Response.ok(stream).build();
    }


}
