<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<button id="action-button">Play</button>
<script>
    fetch('webapi/audio',
        {
            method: 'GET',
            headers: {'Accept': 'audio/mp3'}
        }).then(function (response) {
        if (response.ok) {

            response.blob().then(function (blob) {
                // Créer un objet audio à partir du flux audio récupéré
                let audio = new Audio();
                audio.src = URL.createObjectURL(blob);

                // Récupérer le bouton de lecture et l'élément audio
                let playButton = document.getElementById('action-button');
                // Ajouter un événement de clic au bouton de lecture
                playButton.addEventListener('click', function () {
                    // Démarrer la lecture audio
                    audio.play();
                });

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
