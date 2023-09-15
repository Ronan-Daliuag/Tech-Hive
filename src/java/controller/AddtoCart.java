package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddtoCart extends HttpServlet {

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
            throws ServletException, IOException {
        

        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");
        if(user == null) {
            RequestDispatcher rd = request.getRequestDispatcher("RetrieveProductsList");
            rd.forward(request, response);
        }
        String cart = (String) session.getAttribute("cart");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String product = request.getParameter("prodid");
        
        try {

            //checks if the product is already in the cart
            String query = "SELECT * from cart WHERE cart_code = ? AND prod_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, cart);
            ps.setString(2, product);
            ResultSet rs = ps.executeQuery();

            //already in cart
            if (rs.next()) {
                int prevQuantity = rs.getInt("quantity");
                query = "UPDATE cart SET quantity = ? WHERE cart_code = ? AND prod_id = ?";
                ps = conn.prepareStatement(query);
                ps.setInt(1, quantity + prevQuantity);
                ps.setString(2, cart);
                ps.setString(3, product);
                ps.executeUpdate();
            } else {
                //not in cart, insert
                query = "INSERT INTO cart (cart_code, quantity, prod_id) VALUES"
                        + "(?,?,?);";
                ps = conn.prepareStatement(query);
                ps.setString(1, cart);
                ps.setInt(2, quantity);
                ps.setString(3, product);
                ps.executeUpdate();
            }
            //update cartContents attribute
            query = "SELECT * FROM cart WHERE cart_code = ?";
            ps = conn.prepareStatement(query);

            ps.setString(1, cart);
            rs = ps.executeQuery();

            session.setAttribute("cartContents", rs);

        } catch (SQLException sqle) {
            response.sendRedirect("error500.jsp");
        }
        response.sendRedirect("RetrieveProductsList");
        
    
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
        processRequest(request, response);
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
        processRequest(request, response);
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
