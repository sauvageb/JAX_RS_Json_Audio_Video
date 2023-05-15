<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Citations</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<section class="section">
    <div>
        <h1>Exemple JSON</h1>
        <p class="mb-5">Un code Javascript récupère des citations au format JSON depuis /webapi/quotes</p>
        <form method="post" action="webapi/quotes" class="mb-5">
            <div class="form-content">
                <div class="form-column">
                    <label for="content">Citation :</label>
                    <input type="text" name="content" id="content">
                </div>
            </div>
            <button class="button form-button" type="submit">Ajout citation</button>
        </form>
        <div id="quotes"></div>
    </div>
</section>


<script>
    // Va chercher les citations et les affiche
    fetch('webapi/quotes',
        {
            method: 'GET',
            headers: {'Accept': 'application/json'}
        }).then(function (response) {
        if (response.ok) {
            response.json().then(function (quotes) {
                let container = document.getElementById('quotes');
                quotes.forEach(quote => {
                    container.innerHTML += "<p>" + quote.id + ") " + quote.content + "</p>";
                })

            });
        } else {
            console.error('Erreur lors de la récupération du flux audio : ', response.status);
        }
    }).catch(function (error) {
        console.error('Erreur lors de la récupération du flux audio : ', error);
    });

    const form = document.querySelector("form");
    form.addEventListener('submit', evt => {
        evt.preventDefault();
        const formData = new FormData(form);
        fetch('webapi/quotes',
            {
                method: 'POST',
                headers: {'Content-type': 'application/json'},
                body: JSON.stringify({content: formData.get("content")})

            }).then(function (response) {
            if (response.ok) {
                location.reload();
            } else {
                console.error('Erreur lors de l\'envoi de la citation : ', response.status);
            }
        }).catch(function (error) {
            console.error('Erreur lors de l\'envoi de la citation  : ', error);
        });
    })

</script>

</body>
</html>
