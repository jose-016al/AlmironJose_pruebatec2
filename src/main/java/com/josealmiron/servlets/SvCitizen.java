package com.josealmiron.servlets;

import com.josealmiron.logica.Citizen;
import com.josealmiron.logica.Controladora;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvCitizen", urlPatterns = {"/SvCitizen"})
public class SvCitizen extends HttpServlet {

    private Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Citizen> listCitizens = control.traerCitizens();

        // request.setAttribute("citizens", listCitizens);
        request.getSession().setAttribute("citizens", listCitizens); 

        request.getRequestDispatcher("citizen.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        Citizen citizen = new Citizen();
        citizen.setName(name);
        citizen.setSurname(surname);
        citizen.setEmail(email);
        citizen.setPhone(phone);

        control.crearCitizen(citizen);

        response.sendRedirect("SvCitizen");
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
