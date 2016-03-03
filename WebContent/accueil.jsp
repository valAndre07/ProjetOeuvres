<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Expo : Médiathèque De POLYTECH</title>

    <link rel="stylesheet" href="bootstrap-3.3.6/css/bootstrap.css">
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="icon" type="image/png" href="img/logo.png">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.6/js/bootstrap.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
    <script src="js/valid_form.js"></script>
</head>
<body>

</br></br>
<c:choose>
    <c:when test="${notification == 'ajout adherent'}">
        <div class="alert alert-success ">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            Ajout de l'adhérent réussi !
        </div>
    </c:when>
    <c:when test="${notification == 'erreur'}">
        <div class="alert alert-danger">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            Une erreur s'est produite !
        </div>
    </c:when>
</c:choose>
<div class="container">

	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
			<h1>Médiathèque de POLYTECH - Gestion de l'exposition 2016</h1>
		</div>
	</div>

	</br>
	</br>

	<div class="row">
		<div class="row-height">
			<div class="col-xs-12 col-sm-4 col-md-4 col-height">
				<div id="add_adher_div">
					<div class="button_dashboard" style="background-color: #F39C12;">
						<p>Ajout Adhérent</p>
						<img src="img/add_adherent.png" class="img-responsive">
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-height">
				<a href="Controleur?action=listerAdherent">
				    <div class="button_dashboard" style="background-color:rgb(46,204,113);">
					    <p>Lister les Adhérents</p>
                        <img src="img/list_adherent.png" class="img-responsive">
                    </div>
				</a>
			</div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-height">
                <a href="Controleur?action=editAdherent">
                    <div class="button_dashboard" style="background-color:#9b59b6;">
                        <p>Modifier Adhérent</p>
                        <img src="img/edit_adherent.png" class="img-responsive">
                    </div>
			    </a>
            </div>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12"><p></p></div>
	</div>

	<div class="row">
		<div class="row-height">
			<div class="col-xs-12 col-sm-4 col-md-4 col-height">
                <a href="Controleur?action=insererOeuvre">
                    <div class="button_dashboard" style="background-color:rgb(25,181,254);">
                        <p>Ajout Oeuvre</p>
                        <img src="img/add_oeuvre.png" class="img-responsive">
                    </div>
			    </a>
            </div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-height">
                <a href="Controleur?action=listerOeuvre">
                    <div class="button_dashboard" style="background-color:#ea6153">
                        <p>Lister et modifier les oeuvres</p>
                        <img src="img/list_oeuvre.png" class="img-responsive">
                    </div>
			    </a>
            </div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-height">
                <a href="Controleur?action=reservation">
                    <div class="button_dashboard" style="background-color:#F1C40F;">
                        <p>Réservations</p>
                        <img src="img/resa_oeuvre.png" class="img-responsive">
                    </div>
			    </a>
            </div>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12"><p></p></div>
	</div>
</div>



<!-- /.modal -->
<div class="container">
    <div class="modal fade" tabindex="-1" id="add_adher_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" style="text-align: center;">Ajouter un adhérent</h4>
                </div>
                <form class="form-horizontal" name='identification' data-toggle="validator" method="post" action="Controleur?action=insererAdherent" >
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="control-label col-sm-4">Nom de l'adherent : </label>
                            <div class="col-sm-8">
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
                        <button type="submit" name="bt" class="btn btn-primary">  Valider  </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        $("#add_adher_div").click(function(){
            $("#add_adher_modal").modal("show");
        });
    });
    function initialize() {
        var input = document.getElementById('ville');
        var options = {
            types: ['geocode'],
            componentRestrictions: {country: 'fr'}
        };
        autocomplete = new google.maps.places.Autocomplete(input, options);

    }
    google.maps.event.addDomListener(window, 'load', initialize);
</script>

<footer>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 ">
			<div class="text_footer">Site réalisé par Valentin ANDRÉ et Franck LACASTAIGNERATTE</div>
		</div>
	</div>
</footer>

</body>
</html>