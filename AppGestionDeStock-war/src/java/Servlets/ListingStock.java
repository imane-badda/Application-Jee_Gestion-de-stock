/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import EjbSession.StockFacadeLocal;
import Entites.Stock;
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
public class ListingStock extends HttpServlet {

    @EJB
    private StockFacadeLocal stockFacade;
    
    
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            List<Stock> ListStock = stockFacade.findAll();
            request.setAttribute( "StockSelectionne", "Sélectionnez un stock" );
            request.setAttribute( "ListDesStocks", ListStock );
            request.setAttribute( "ListStock", ListStock );
            this.getServletContext().getRequestDispatcher("/WEB-INF/tableStock.jsp").forward(request, response);
        }
        catch(Exception e){ System.out.println(e);}
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String nomS = request.getParameter("nomStock");
            List<Stock> ListStock ;
            if(nomS.equals("Tous les stocks")){
                 ListStock = stockFacade.findAll();
            }else
                 ListStock = stockFacade.findAllByStock(nomS);
            
            request.setAttribute( "ListStock", ListStock );
            request.setAttribute( "StockSelectionne", nomS );
            
            List<Stock> ListDesStocks = stockFacade.findAll();
            request.setAttribute( "ListDesStocks", ListDesStocks );
            this.getServletContext().getRequestDispatcher("/WEB-INF/tableStock.jsp").forward(request, response);
            
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
