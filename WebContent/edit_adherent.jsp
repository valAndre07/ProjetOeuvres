<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Affichage de tous les adhérents</title>

    <link rel="stylesheet" href="bootstrap-3.3.6/css/bootstrap.css">
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" href="CSS/data_tables.css">
    <link rel="icon" type="image/png" href="img/logo.png">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.6/js/bootstrap.js"></script>
    <script type="text/javascript" src="js/data_tables.js"></script>
</head>
<body>

<c:choose>
    <c:when test="${notification == 'erreur'}">
        <div class="alert alert-danger">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            Erreur lors de l'accès à la BDD !
        </div>
    </c:when>
</c:choose>

<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12">
        <h1>Édition des Adhérents</h1>
    </div>
</div>
<div class="button-return">
    <a href="index.jsp" class="link-return"><strong>Retour Accueil</strong></a>
</div>

</br></br>

<div class="row">
    <div class="col-xs-1 col-sm-1 col-md-1">
    </div>
    <div class="col-xs-10 col-sm-10 col-md-10">
        <table class="display hover stripe row-border" id="table_list">
            <thead>
            <tr>
                <th>Numéro</th>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Ville</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${mesAdherents}" var="item">
                <tr>
                    <td>${item.idAdherent}</td>
                    <td>${item.nomAdherent}</td>
                    <td>${item.prenomAdherent}</td>
                    <td>${item.villeAdherent}</td>
                    <td><a href="#"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;<a href="#"><span class="glyphicon glyphicon-trash"></span></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-xs-1 col-sm-1 col-md-1">
    </div>
</div>

<script>
    $(document).ready(function(){
        $('#table_list').dataTable( {
            "language": {
                "sProcessing":     "Traitement en cours...",
                "sSearch":         "Rechercher&nbsp;:",
                "sLengthMenu":     "Afficher _MENU_ &eacute;l&eacute;ments",
                "sInfo":           "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
                "sInfoEmpty":      "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ment",
                "sInfoFiltered":   "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
                "sInfoPostFix":    "",
                "sLoadingRecords": "Chargement en cours...",
                "sZeroRecords":    "Aucun &eacute;l&eacute;ment &agrave; afficher",
                "sEmptyTable":     "Aucune donn&eacute;e disponible dans le tableau",
                "oPaginate": {
                    "sFirst":      "Premier",
                    "sPrevious":   "Pr&eacute;c&eacute;dent",
                    "sNext":       "Suivant",
                    "sLast":       "Dernier"
                }
            }
        } );
    });
</script>

</body>
</html>