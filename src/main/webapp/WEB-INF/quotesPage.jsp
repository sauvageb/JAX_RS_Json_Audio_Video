<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Citations</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<button id="action-button">Récupérer Citations</button>
<div id="quotes"></div>

<script>
    let actionButton = document.getElementById('action-button');
    // Ajouter un événement de clic au bouton de lecture
    actionButton.addEventListener('click', function () {
        // Va chercher les citations et les affiche

        fetch('webapi/quotes',
            {
                method: 'GET',
                headers: {'Accept': 'application/json'}
            }).then(function (response) {
            if (response.ok) {
                response.json().then(function (quotes) {
                    let container = document.getElementById('quotes');
                    console.log(quotes)
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

    });

</script>

</body>
</html>
