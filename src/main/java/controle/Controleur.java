package controle;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.*;
import dao.Service;
import meserreurs.*;

/**
 * Servlet implementation class Controleur
 */
@WebServlet("/Controleur")
public class Controleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ACTION_TYPE = "action";
	private static final String INDEX = "index";
	private static final String LISTER_ADHERENT = "listerAdherent";
	private static final String DELETE_ADHERENT = "deleteAdherent";
	private static final String LISTER_OEUVRE = "listerOeuvre";
	private static final String INSERER_ADHERENT = "insererAdherent";
	private static final String INSERER_OEUVRE = "insererOeuvre";
    private static final String EDIT_ADHERENT = "editAdherent";
	private static final String ERROR_KEY = "messageErreur";
	private static final String ERROR_PAGE = "/erreur.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controleur() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processusTraiteRequete(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processusTraiteRequete(request, response);
	}

	protected void processusTraiteRequete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String actionName = request.getParameter(ACTION_TYPE);
		String destinationPage = ERROR_PAGE;
		// execute l'action
        if (INDEX.equals(actionName))
        {
            try {
                Service unService = new Service();
                request.setAttribute("props", unService.consulterListeProprietaires());

            } catch (MonException e) {
                // TODO Auto-generated catch block
                request.setAttribute("notification", "erreur");
                e.printStackTrace();
            }
            destinationPage = "/accueil.jsp";
        }
		else if (LISTER_ADHERENT.equals(actionName)) {
			try {

				Service unService = new Service();
				request.setAttribute("mesAdherents", unService.consulterListeAdherents());

			} catch (MonException e) {
				// TODO Auto-generated catch block
                request.setAttribute("notification", "erreur");
				e.printStackTrace();
			}

			destinationPage = "/listerAdherent.jsp";
		}

        else if (LISTER_OEUVRE.equals(actionName)) {
            try {

                Service unService = new Service();
                request.setAttribute("oeuvres", unService.consulterListeOeuvres());

            } catch (MonException e) {
                // TODO Auto-generated catch block
                request.setAttribute("notification", "erreur");
                e.printStackTrace();
            }

            destinationPage = "/listerOeuvres.jsp";
        }
		else if (INSERER_ADHERENT.equals(actionName)) {
			try {
				Adherent unAdherent = new Adherent();
				unAdherent.setNomAdherent(request.getParameter("txtnom"));
				unAdherent.setPrenomAdherent(request.getParameter("txtprenom"));
				unAdherent.setVilleAdherent(request.getParameter("txtville"));
				Service unService = new Service();
				unService.insertAdherent(unAdherent);
				request.setAttribute("notification", "ajout adherent");

			} catch (MonException e) {
				// TODO Auto-generated catch block
                request.setAttribute("notification", "erreur");
				e.printStackTrace();
			}
			destinationPage = "/accueil.jsp";
		}
        else if (EDIT_ADHERENT.equals(actionName)) {
            try {
                Service unService = new Service();
                request.setAttribute("mesAdherents", unService.consulterListeAdherents());

            } catch (MonException e) {
                // TODO Auto-generated catch block
                request.setAttribute("notification", "erreur");
                e.printStackTrace();
            }
            destinationPage = "/edit_adherent.jsp";
        }
		else if (INSERER_OEUVRE.equals(actionName)) {
			try {
				Oeuvrevente uneOeuvre = new Oeuvrevente();
				uneOeuvre.setTitreOeuvrevente(request.getParameter("titre"));
				uneOeuvre.setPrixOeuvrevente(Float.parseFloat(request.getParameter("prix")));
				//uneOeuvre.setProprietaire(request.getParameter("proprietaire"));
				uneOeuvre.setEtatOeuvrevente("L");
				Service unService = new Service();
				unService.insertOeuvre(uneOeuvre);
			}catch (MonException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		else {
			String messageErreur = "[" + actionName + "] n'est pas une action valide.";
			request.setAttribute(ERROR_KEY, messageErreur);
		}
		// Redirection vers la page jsp appropriee
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(destinationPage);
		dispatcher.forward(request, response);

	}

}
