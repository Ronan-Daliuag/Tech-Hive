/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletConfig;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author user
 */
public class LoginServlet extends HttpServlet {

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

        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();

        session.setAttribute("connection", conn);

        try {

            String user = request.getParameter("username");
            String pass = request.getParameter("password");

            String signupname = request.getParameter("signupname");
            String signupemail = request.getParameter("signupemail");
            String signuppassword = request.getParameter("signuppassword");
            String signuppassword2 = request.getParameter("signuppassword2");

            //login
            if (user != null && pass != null) {
                String query = "SELECT * FROM login WHERE username = ? AND passcode = ?";
                PreparedStatement ps = conn.prepareStatement(query);

                ps.setString(1, user);
                ps.setString(2, pass);

                ResultSet rs = ps.executeQuery();

                if (!rs.next()) {
                    response.sendRedirect("errorLogin.jsp");

                } else {
                    if (conn != null) {
                        session.setAttribute("user", user);
                        session.setAttribute("pass", pass);
                        session.setAttribute("email", rs.getString("email"));
                        session.setAttribute("cart", user + "cart");

                        response.sendRedirect("accountPage.jsp");
                    } else {
                        response.sendRedirect("errorLogin.jsp");
                    }
                }
                //signup
            } else if (signupname != null && signupemail != null
                    && signuppassword != null && signuppassword2 != null
                    && signuppassword.equals(signuppassword2)) {

                //set foreign key constraints off
                String query = "SET FOREIGN_KEY_CHECKS=0";
                Statement stmt = conn.createStatement();
                stmt.execute(query);

                //create user table and cart code (username+"cart")
                query = "INSERT INTO login(user_id, email, username, passcode, user_role,cart_code) VALUES (NULL, ?, ?, ?, 'user',concat(?,'cart'));";
                      //  + "insert into cart(cart_code,prod_id) values(Concat((select username from login where user_id=last_insert_id()),'cart'),'none');\n"
                      //  + "update login\n" + "set cart_code = ?'cart'\n" + "where username=?;";
                PreparedStatement ps = conn.prepareStatement(query);

                ps.setString(1, signupemail);
                ps.setString(2, signupname);
                ps.setString(3, signuppassword);
                ps.setString(4, signupname);
               
                ps.executeUpdate();

                
                session.setAttribute("user", signupname);
                session.setAttribute("pass", signuppassword);
                session.setAttribute("email", signupemail);
                session.setAttribute("cart", signupname + "cart");
                response.sendRedirect("accountPage.jsp");

            }

        } catch (SQLException sqle) {
            sqle.printStackTrace();
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
