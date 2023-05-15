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
            <p class="mb-5">Ce projet démo concerne l'API JAX-RS implémenté par Jersey : </p>
            <ul>
                <li>[GET] /webapi/quotes : Renvoie des citations en JSON</li>
                <li>[POST] /webapi/quotes : Ajout d'une citation en JSON</li>
                <li>[GET] /webapi/audio : Renvoie un son de batterie</li>
                <li>[GET] /webapi/video : Renvoie une vidéo</li>
            </ul>
        </div>
    </section>
</div>
</body>
</html>
