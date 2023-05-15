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

@Path("video")
public class VideoResource {

    @GET
    @Produces("video/mp4")
    public Response getVideo(@Context ServletContext servletContext) {
        // Récupérer le fichier vidéo à partir du système de fichiers local
        String filePath = servletContext.getRealPath("/WEB-INF/video.mp4");
        File videoFile = new File(filePath);

        // Vérifier si le fichier existe
        if (!videoFile.exists()) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        // Créer une StreamingOutput pour envoyer le flux vidéo
        StreamingOutput stream = output -> {
            try (FileInputStream inputStream = new FileInputStream(videoFile)) {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    output.write(buffer, 0, bytesRead);
                }
            } catch (IOException e) {
                throw new WebApplicationException("Erreur lors de la récupération du flux vidéo : " + e.getMessage());
            }
        };

        // Créer une réponse avec la StreamingOutput
        return Response.ok(stream).build();
    }
}
