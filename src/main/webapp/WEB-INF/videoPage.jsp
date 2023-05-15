<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<video id="video-player" controls>
    <source src="" type="video/mp4">
</video>

<script>
    fetch('webapi/video',
        {
            method: 'GET',
            headers: {'Accept': 'video/mp4'}
        }).then(function (response) {
        if (response.ok) {

            response.blob().then(function (blob) {
                // Créer un objet video à partir du flux audio récupéré
                let videoUrl = URL.createObjectURL(blob);
                // Récupérer le lecteur vidéo et définir la source
                let videoPlayer = document.getElementById('video-player');
                videoPlayer.src = videoUrl;
                videoPlayer.style.width = "640px";
                videoPlayer.style.height = "360px";
            });
        } else {
            console.error('Erreur lors de la récupération du flux audio : ', response.status);
        }
    }).catch(function (error) {
        console.error('Erreur lors de la récupération du flux audio : ', error);
    });
</script>

</body>
</html>
