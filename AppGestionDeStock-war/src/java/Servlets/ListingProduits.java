/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import EjbSession.MarqueFacadeLocal;
import EjbSession.ProduitFacadeLocal;
import Entites.Marque;
import Entites.Produit;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
public class ListingProduits extends HttpServlet {

    @EJB
    private ProduitFacadeLocal produit;
    @EJB
    private MarqueFacadeLocal marque;
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            List<Produit> ListProduits = produit.findAll();
            request.setAttribute( "ListProduits", ListProduits );
            List<Marque> Listmarque = marque.findAll();
            request.setAttribute( "MarqueSelectionnee", "Sélectionnez une marque" );
            request.setAttribute( "ListMarque", Listmarque );
            this.getServletContext().getRequestDispatcher("/WEB-INF/tableProduit.jsp").forward(request, response);
        }
        catch(Exception e){ System.out.println(e);}
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String nomM = request.getParameter("marque");
            List<Produit> ListProduits ;
            if(nomM.equals("Toutes les marques")){
                 ListProduits = produit.findAll();
            }else
                 ListProduits = produit.findAllByMarque(nomM);
            
            request.setAttribute( "ListProduits", ListProduits );
            request.setAttribute( "MarqueSelectionnee", nomM );
            
            List<Marque> Listmarque = marque.findAll();
            request.setAttribute( "ListMarque", Listmarque );
            this.getServletContext().getRequestDispatcher("/WEB-INF/tableProduit.jsp").forward(request, response);
            
        }
        
    }


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
