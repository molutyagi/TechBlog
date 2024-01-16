/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author imrya
 */
@MultipartConfig
public class EditUserServlet extends HttpServlet {

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

        PrintWriter out = response.getWriter();

        try {

            //fetch data to edit
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String about = request.getParameter("user_about");
            Part part = request.getPart("image");
            String imageName = part.getSubmittedFileName();

            //get user from session
            HttpSession hs = request.getSession();
            User user = (User) hs.getAttribute("currentUser");

            //edit user values
            user.setEmail(email);
            user.setName(name);
            user.setPassword(password);
            user.setAbout(about);
            String oldProfile = user.getProfile();
            if (imageName != "") {
                user.setProfile(imageName);
            } else {
                user.setProfile(oldProfile);

            }

            //update database
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            boolean ans = dao.updateUser(user);
            if (ans == true) {
                //change new profile in directory
                String path = request.getRealPath("/" + "static/imgs" + File.separator + user.getProfile());
                String oldPath = request.getRealPath("/" + "static/imgs" + File.separator + oldProfile);

                if (imageName != "") {

                    if (!oldProfile.equals("default.png")) {
                        Helper.deleteFile(oldPath);
                    }
                    if (Helper.saveFile(part.getInputStream(), path)) {
                        Message msg = new Message("User Updated Successfully.", "success", "alert-success");
                        hs.setAttribute("message", msg);
                    } else {
                        Message msg = new Message("Couldn't Update User.", "error", "alert-danger");
                        hs.setAttribute("message", msg);
//                    response.sendRedirect("profile");
                    }
                }

            } else {
                Message msg = new Message("Couldn't Update User.", "error", "alert-danger");
                hs.setAttribute("message", msg);
//                response.sendRedirect("profile");
            }

            response.sendRedirect("profile");

        } catch (Exception e) {
            e.printStackTrace();
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
