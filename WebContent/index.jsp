<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="refresh" content="0;URL=javascript:fermer();">
<title>Expo : Médiathèque De POLYTECH</title>
</head>

<link rel="stylesheet" href="bootstrap-3.3.6/css/bootstrap.css">
<link rel="stylesheet" href="CSS/dashboard_css.css">

</head>

<body>

</br>
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
				<a href="Controleur?action=ajouterAdherent">
					<div class="button_dashboard" style="background-color:rgb(25,181,254);">
						<p>Ajout Adhérent</p>
						<img src="img/add_adherent.png" class="img-responsive">
					</div>
				</a>
			</div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-height"><a href="Controleur?action=listerAdherent">
				<div class="button_dashboard" style="background-color:rgb(46,204,113);"><p>Lister les Adhérents</p></div>
			</a></div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-height"><a href="">
				<div class="button_dashboard" style="background-color:#F1C40F;"><p>Modifier Adhérent</p></div>
			</a></div>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12"><p></p></div>
	</div>

	<div class="row">
		<div class="row-height">
			<div class="col-xs-12 col-sm-4 col-md-4 col-height"><a href="Controleur?action=ajouterAdherent">
				<div class="button_dashboard" style="background-color:#F39C12"><p>Ajout Oeuvre</p></div>
			</a></div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-height"><a href="Controleur?action=listerAdherent">
				<div class="button_dashboard" style="background-color:#ea6153"><p>Lister les oeuvres</p></div>
			</a></div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-height"><a href="">
				<div class="button_dashboard" style="background-color:#9b59b6;"><p>Réservations</p></div>
			</a></div>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12"><p></p></div>
	</div>
</div>

<footer>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 ">
			<div class="text_footer">Site réalisé par Valentin ANDRÉ et Franck LACASTAIGNERATTE</div>
		</div>
	</div>
</footer>


</body>
</html>