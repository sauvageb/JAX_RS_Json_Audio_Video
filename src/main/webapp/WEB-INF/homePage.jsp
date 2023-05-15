<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
    <section class="section">
        <div>
            <h1>Exemples JAX-RS</h1>
            <p class="mb-5">Ce projet démo interroge l'API Rest JAX-RS disponible sur /webapi/ (implémentée par Jersey)
                : </p>
            <ul class="mb-5">
                <li>[GET] /webapi/quotes : Permet de récupérer des citations en JSON</li>
                <li>[POST] /webapi/quotes : Permet d'ajouter une citation (en JSON)</li>
                <li>[GET] /webapi/audio : Permet de récupérer un son de batterie</li>
                <li>[GET] /webapi/video : Permet de récupérer une vidéo</li>
            </ul>
            <p>Le code qui interroge ces différentes routes est en Javascript et utilise l'API fetch.</p>
            <p>Vous pouvez naviguer vers les différents exemples Citations, Audio et Vidéo dans le menu.</p>
        </div>
    </section>
</div>
</body>
</html>
