/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Betty
 */
public class RetrieveProductsList extends HttpServlet {

    Connection conn;

    @Override
    public void init() throws ServletException {

        try {
            Class.forName(getServletContext().getInitParameter("jdbcClassName"));
            String username = getServletContext().getInitParameter("dbUserName");
            String password = getServletContext().getInitParameter("dbPassword");
            StringBuffer url = new StringBuffer(getServletContext().getInitParameter("jdbcDriverURL"))
                    .append("://")
                    .append(getServletContext().getInitParameter("dbHostName"))
                    .append(":")
                    .append(getServletContext().getInitParameter("dbPort"))
                    .append("/")
                    .append(getServletContext().getInitParameter("databaseName"));

            conn = DriverManager.getConnection(url.toString(), username, password);

        } catch (SQLException sqle) {
            System.out.println("SQLException error occured - "
                    + sqle.getMessage());
        } catch (ClassNotFoundException nfe) {
            System.out.println("ClassNotFoundException error occured - "
                    + nfe.getMessage());
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();

        session.setAttribute("connection", conn);

        String sortType = request.getParameter("sort");

        try {

            if (sortType != null) {
                if (sortType.equals("Lowest Price")) {

                    String query = "SELECT * FROM product where prod_id !='sub' ORDER BY price ASC;";
                    PreparedStatement ps = conn.prepareStatement(query);

                    ResultSet rs = ps.executeQuery();
                    request.setAttribute("results", rs);
                } else if (sortType.equals("Highest Price")) {

                    String query = "SELECT  * FROM product where prod_id !='sub' ORDER BY price DESC;";
                    PreparedStatement ps = conn.prepareStatement(query);

                    ResultSet rs = ps.executeQuery();
                    request.setAttribute("results", rs);
                } else if (sortType.equals("console")) {

                    String query = "SELECT  * FROM product where prod_type='console' ORDER BY price ASC;";
                    PreparedStatement ps = conn.prepareStatement(query);

                    ResultSet rs = ps.executeQuery();
                    request.setAttribute("results", rs);
                } else if (sortType.equals("peripherals")) {

                    String query = "SELECT  * FROM product where prod_type='peripheral' ORDER BY price ASC;";
                    PreparedStatement ps = conn.prepareStatement(query);

                    ResultSet rs = ps.executeQuery();
                    request.setAttribute("results", rs);
                } else if (sortType.equals("laptop")) {

                    String query = "SELECT  * FROM product where prod_type='laptop' ORDER BY price ASC;";
                    PreparedStatement ps = conn.prepareStatement(query);

                    ResultSet rs = ps.executeQuery();
                    request.setAttribute("results", rs);
                } else if (sortType.equals("prebuilt")) {

                    String query = "SELECT  * FROM product where prod_type='prebuilt' ORDER BY price ASC;";
                    PreparedStatement ps = conn.prepareStatement(query);

                    ResultSet rs = ps.executeQuery();
                    request.setAttribute("results", rs);
                }
            } //name default
            else {

                String query = "SELECT * FROM product where prod_id !='sub' ORDER BY price ASC;";
                PreparedStatement ps = conn.prepareStatement(query);

                ResultSet rs = ps.executeQuery();
                request.setAttribute("results", rs);
            }
        } catch (SQLException sqle) {
            response.sendRedirect("error500.jsp");
        }

        request.getRequestDispatcher("products.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RetrieveProductsList.class.getName()).log(Level.SEVERE, null, ex);
        }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RetrieveProductsList.class.getName()).log(Level.SEVERE, null, ex);
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
