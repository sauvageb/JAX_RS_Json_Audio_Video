<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
    <section class="section">
        <div>
            <h1>Exemple Vidéo</h1>
            <p class="mb-5">Un code Javascript récupère une vidéo depuis /webapi/video</p>

            <video id="video-player" controls>
                <source src="" type="video/mp4">
            </video>
        </div>
    </section>
</div>



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
