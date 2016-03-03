package dao;

import meserreurs.MonException;
import java.util.*;

import metier.*;
import persistance.*;

public class Service {

	// Mise � jour des caract�ristiques d'un adh�rent
	// Le booleen indique s'il s'agit d'un nouvel adh�rent, auquel cas on fait
	// une cr�ation

	public void insertAdherent(Adherent unAdherent) throws MonException {
		String mysql;

		DialogueBd unDialogueBd = DialogueBd.getInstance();
		try {
			mysql = "insert into adherent  (nom_adherent,prenom_adherent,ville_adherent)  " + "values ('"
					+ unAdherent.getNomAdherent();
			mysql += "'" + ",'" + unAdherent.getPrenomAdherent() + "','" + unAdherent.getVilleAdherent() + "')";

			unDialogueBd.insertionBD(mysql);
		} catch (MonException e) {
			throw e;
		}
	}

	public void deleteAdherent(int idAdherent) throws MonException {
		String mysql;

		DialogueBd unDialogueBd = DialogueBd.getInstance();
		try {
			mysql = "delete from adherent where id_adherent="+idAdherent;
			unDialogueBd.insertionBD(mysql);
		} catch (MonException e) {
			throw e;
		}
	}

	public void updateAdherent(int idAdherent, String nom, String prenom, String ville) throws MonException {
		String mysql;

		DialogueBd unDialogueBd = DialogueBd.getInstance();
		try {
			mysql = "UPDATE adherent SET nom_adherent="+"'"+nom+"'"+", prenom_adherent="+"'"+prenom+"'"+", ville_adherent="+"'"+ville+"'"+" WHERE id_adherent="+idAdherent;
			unDialogueBd.insertionBD(mysql);
		} catch (MonException e) {
			throw e;
		}
	}

	// gestion des adherents
	// Consultation d'un adh�rent par son num�ro
	// Fabrique et renvoie un objet adh�rent contenant le r�sultat de la requ�te
	// BDD
	public Adherent consulterAdherent(int numero) throws MonException {
		String mysql = "select * from adherent where numero_adherent=" + numero;
		List<Adherent> mesAdh = consulterListeAdherents(mysql);
		if (mesAdh.isEmpty())
			return null;
		else {
			return mesAdh.get(0);
		}
	}

	// Consultation des adh�rents
	// Fabrique et renvoie une liste d'objets adh�rent contenant le r�sultat de
	// la requ�te BDD
	public List<Adherent> consulterListeAdherents() throws MonException {
		String mysql = "select * from adherent";
		return consulterListeAdherents(mysql);
	}

	private List<Adherent> consulterListeAdherents(String mysql) throws MonException {
		List<Object> rs;
		List<Adherent> mesAdherents = new ArrayList<Adherent>();
		int index = 0;
		try {
			DialogueBd unDialogueBd = DialogueBd.getInstance();
			rs = DialogueBd.lecture(mysql);
			while (index < rs.size()) {
				// On cr�e un stage
				Adherent unA = new Adherent();
				// il faut redecouper la liste pour retrouver les lignes
				unA.setIdAdherent(Integer.parseInt(rs.get(index + 0).toString()));
				unA.setNomAdherent(rs.get(index + 1).toString());
				unA.setPrenomAdherent(rs.get(index + 2).toString());
				unA.setVilleAdherent(rs.get(index + 3).toString());
				// On incr�mente tous les 3 champs
				index = index + 4;
				mesAdherents.add(unA);
			}

			return mesAdherents;
		} catch (Exception exc) {
			throw new MonException(exc.getMessage(), "systeme");
		}
	}

	public void insertOeuvre(Oeuvrevente uneOeuvre) throws MonException  {
		String mysql;

		DialogueBd unDialogueBd = DialogueBd.getInstance();
		try {
			mysql = "insert into oeuvrevente  (titre_oeuvrevente,prix_oeuvrevente,etat_oeuvrevente,id_proprietaire)  "
					+ "values ('" + uneOeuvre.getTitreOeuvrevente();
			mysql += "'" + ",'" + uneOeuvre.getPrixOeuvrevente() + "','" + uneOeuvre.getEtatOeuvrevente();
			mysql += "'" + ",'" + uneOeuvre.getProprietaire() + "')";

			unDialogueBd.insertionBD(mysql);
		} catch (MonException e) {
			throw e;
		}
	}

	// Consultation des oeuvres
	// Fabrique et renvoie une liste d'objets oeuvres contenant le r�sultat de
	// la requ�te BDD
	public List<Oeuvrevente> consulterListeOeuvres() throws MonException {
		String mysql = "select * from oeuvrevente";
		return consulterListeOeuvres(mysql);
	}

	private List<Oeuvrevente> consulterListeOeuvres(String mysql) throws MonException {
		List<Object> rs;
		List<Oeuvrevente> mesOeuvres = new ArrayList<Oeuvrevente>();
		int index = 0;
		try {
			DialogueBd unDialogueBd = DialogueBd.getInstance();
			rs = DialogueBd.lecture(mysql);
			while (index < rs.size()) {
				// On cr�e un stage
				Oeuvrevente oeuvre = new Oeuvrevente();
				// il faut redecouper la liste pour retrouver les lignes
                oeuvre.setIdOeuvrevente(Integer.parseInt(rs.get(index + 0).toString()));
				oeuvre.setTitreOeuvrevente(rs.get(index + 1).toString());
                oeuvre.setEtatOeuvrevente(rs.get(index + 2).toString());
                oeuvre.setPrixOeuvrevente(Float.parseFloat(rs.get(index + 3).toString()));
                Proprietaire proprietaire = proprietaireById(Integer.parseInt(rs.get(index + 4).toString()));
                oeuvre.setProprietaire(proprietaire);
                index = index + 5;
                mesOeuvres.add(oeuvre);
			}

			return mesOeuvres;
		} catch (Exception exc) {
			throw new MonException(exc.getMessage(), "systeme");
		}
	}

    // Consultation des proprietaires
    // Fabrique et renvoie une liste d'objets oeuvres contenant le r�sultat de
    // la requ�te BDD
    public List<Proprietaire> consulterListeProprietaires() throws MonException {
        String mysql = "select * from proprietaire";
        return consulterListeProprietaires(mysql);
    }

    private List<Proprietaire> consulterListeProprietaires(String mysql) throws MonException {
        List<Object> rs;
        List<Proprietaire> props = new ArrayList<Proprietaire>();
        int index = 0;
        try {
            DialogueBd unDialogueBd = DialogueBd.getInstance();
            rs = DialogueBd.lecture(mysql);
            while (index < rs.size()) {
                // On cr�e un stage
                Proprietaire prop = new Proprietaire();
                // il faut redecouper la liste pour retrouver les lignes
                prop.setIdProprietaire(Integer.parseInt(rs.get(index + 0).toString()));
                prop.setNomProprietaire(rs.get(index + 1).toString());
                prop.setPrenomProprietaire(rs.get(index + 2).toString());
				index = index + 3;
                props.add(prop);
            }

            return props;
        } catch (Exception exc) {
            throw new MonException(exc.getMessage(), "systeme");
        }
    }
    // gestion des proprietaire
    // Consultation d'un proprietaire par son num�ro
    // Fabrique et renvoie un objet proprietaire contenant le r�sultat de la requ�te
    // BDD
    public Proprietaire proprietaireById(int numero) throws MonException {
        String mysql = "select * from proprietaire where id_proprietaire=" + numero;
        List<Object> rs;
        DialogueBd unDialogueBd = DialogueBd.getInstance();
        rs = DialogueBd.lecture(mysql);
        int index = 0;
        Proprietaire prop = new Proprietaire();
        // il faut redecouper la liste pour retrouver les lignes
        prop.setIdProprietaire(Integer.parseInt(rs.get(index + 0).toString()));
        prop.setNomProprietaire(rs.get(index + 1).toString());
        prop.setPrenomProprietaire(rs.get(index + 2).toString());
        index = index + 3;
        return prop;
    }
}
