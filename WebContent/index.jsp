<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="refresh" content="0;URL=javascript:fermer();">
<title>Expo : Médiathèque De POLYTECH</title>
</head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
</head>


<script language="JavaScript">
	function fermer() {
		window.close();
	}
</script>

<body style="margin-right:10px;margin-left:10px;">

<p align="center"></p>
<p align="center">
	<font face="Arial" size="4"><u>Médiathèque de POLYTECH </u></font>
</p>
<p align="center">
	<font color="#004080" face="Arial" size="4">Gestion de
		l'exposition 2016</font>
</p>
</br>
<div class="container-fluid">
	<div class="row">
		<div class="row-height">
			<div class="col-xs-12 col-sm-4 col-md-4 col-height"><a href="Controleur?action=ajouterAdherent">
				<div style="background-color:rgb(25,181,254);padding-top:15%;padding-bottom:15%"><p style="text-align:center;">Ajout Adhérent</p></div>
			</a></div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-height"><a href="Controleur?action=listerAdherent">
				<div style="background-color:#9b59b6;padding-top:15%;padding-bottom:15%"><p style="text-align:center;">Lister les Adhérents</p></div>
			</a></div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-height"><a href="">
				<div style="background-color:#2ecc71;padding-top:15%;padding-bottom:15%"><p style="text-align:center;">Modifier Adhérent</p></div>
			</a></div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12"><p></p></div>
	</div>
	<div class="row">
		<div class="row-height">
			<div class="col-xs-12 col-sm-4 col-md-4 col-height"><a href="Controleur?action=ajouterAdherent">
				<div style="background-color:rgb(25,181,254);padding-top:15%;padding-bottom:15%"><p style="text-align:center;">Ajout Oeuvre</p></div>
			</a></div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-height"><a href="Controleur?action=listerAdherent">
				<div style="background-color:rgb(248,148,6);padding-top:15%;padding-bottom:15%"><p style="text-align:center;">Lister les oeuvres</p></div>
			</a></div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-height"><a href="">
				<div style="background-color:rgb(46,204,113);padding-top:15%;padding-bottom:15%"><p style="text-align:center;">Réservations</p></div>
			</a></div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12"><p></p></div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-4 col-md-4"></div>
		<div class="col-xs-12 col-sm-4 col-md-4">
			<a href="javascript:fermer()"><div style="background-color:#ea6153;padding-top:15%;padding-bottom:15%"><p style="text-align:center;">Quitter</p></div>
			</a></div>
		<div class="col-xs-12 col-sm-4 col-md-4"></div>
	</div>
</div>

</body>
</html>