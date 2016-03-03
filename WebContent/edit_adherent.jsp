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
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
    <script src="js/valid_form.js"></script>
    <script type="text/javascript" src="js/data_tables.js"></script>
</head>
<body>

<c:choose>
    <c:when test="${notification == 'adherent supprimé'}">
        <div class="alert alert-success ">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            Suppression de l'adhérent réussie !
        </div>
    </c:when>
    <c:when test="${notification == 'update effectué'}">
        <div class="alert alert-success ">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            Modification de l'adhérent réussie !
        </div>
    </c:when>
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
    <a href="Controleur?action=index" class="link-return"><strong>Retour Accueil</strong></a>
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
                <tr id="edit_${item.idAdherent}">
                    <td>${item.idAdherent}</td>
                    <td>${item.nomAdherent}</td>
                    <td>${item.prenomAdherent}</td>
                    <td>${item.villeAdherent}</td>
                    <td>
                        <a href="#" onClick="editAdherent(${item.idAdherent})"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;
                        <a href="/Controleur?action=deleteAdherent&idAdherent=${item.idAdherent}" data-confirm="Etes vous sûr de vouloir supprimer cet adhérent ?">
                            <span class="glyphicon glyphicon-trash"></span>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-xs-1 col-sm-1 col-md-1">
    </div>
</div>


<!-- /.modal -->
<div class="container">
    <div class="modal fade" tabindex="-1" id="edit_adher_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" style="text-align: center;">Modifier un adhérent</h4>
                </div>
                <form class="form-horizontal" name='identification' data-toggle="validator" method="post" action="Controleur?action=updateAdherent" >
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="control-label col-sm-4">Nom de l'adherent : </label>
                            <div class="col-sm-8">
                                <input type="hidden" name="idAdherent" id="idAdherent">
                                <input type="text" class="form-control" name="txtnom" placeholder="Indiquez le nom" id ="nom" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Prénom de l'adherent : </label>
                            <div class="col-sm-8">
                                <input type="text" name="txtprenom" class="form-control" placeholder="Indiquez le prénom" id ="prenom" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Ville de l'adherent : </label>
                            <div class="col-sm-8">
                                <input type="text" name="txtville" class="form-control" id ="ville" required="required">
                            </div>
                            <div></div>
                        </div>
                    </div>
                    <div class="modal-footer" style="text-align: center;">
                        <button type="submit" name="bt" class="btn btn-primary">  Valider les modifications </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<script>
    function editAdherent(idAdherent)
    {
        var idAdherent =$('#edit_'+idAdherent).find('td').eq(0).text();
        var nom =$('#edit_'+idAdherent).find('td').eq(1).text();
        var prenom =$('#edit_'+idAdherent).find('td').eq(2).text();
        var ville=$('#edit_'+idAdherent).find('td').eq(3).text();
        $('#idAdherent').val(idAdherent);
        $('#nom').val(nom);
        $('#prenom').val(prenom);
        $('#ville').val(ville);
        $("#edit_adher_modal").modal("show");
    }
    function initialize() {
        var input = document.getElementById('ville');
        var options = {
            types: ['geocode'],
            componentRestrictions: {country: 'fr'}
        };
        autocomplete = new google.maps.places.Autocomplete(input, options);
    }
    google.maps.event.addDomListener(window, 'load', initialize);
    $(document).ready(function(){
        $('a[data-confirm]').click(function(ev) {
            var href = $(this).attr('href');
            if (!$('#dataConfirmModal').length) {
                $('body').append(
                        '<div id="dataConfirmModal" class="modal" role="dialog" aria-labelledby="dataConfirmLabel" aria-hidden="true">' +
                            '<div class="modal-header" style="background-color: white;">' +
                                '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>' +
                                '<h3 id="dataConfirmLabel">Veuillez confirmer</h3>' +
                            '</div>' +
                            '<div class="modal-body" style="background-color: white;">' +
                            '</div>' +
                            '<div class="modal-footer" style="background-color: white; text-align: center;" >' +
                                '<button class="btn" data-dismiss="modal" aria-hidden="true">Annuler</button>' +
                                '<a class="btn btn-primary" id="dataConfirmOK">Valider</a>' +
                            '</div>' +
                        '</div>');
            }
            $('#dataConfirmModal').find('.modal-body').text($(this).attr('data-confirm'));
            $('#dataConfirmOK').attr('href', href);
            $('#dataConfirmModal').modal({show:true});
            return false;
        });
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