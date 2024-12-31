package com.josealmiron.servlets;

import com.josealmiron.logica.Appointment;
import com.josealmiron.logica.Controladora;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvIndex", urlPatterns = {"/SvIndex"})
public class SvIndex extends HttpServlet {

    private Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Appointment> appointments = control.traerAppointments();

        LocalDate today = LocalDate.now();
        List<Appointment> todaysAppointments = appointments.stream()
                .filter(a -> a.getAssignedDate().toLocalDate().equals(today))
                .sorted(Comparator.comparing(Appointment::getAssignedDate))
                .collect(Collectors.toList());

        request.getSession().setAttribute("todaysAppointments", todaysAppointments);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Long id = Long.valueOf(request.getParameter("appointmentId"));
        String status = request.getParameter("status");
        
        boolean isChecked = "true".equals(status) || "on".equals(status); 
        
        Appointment appointment = control.getAppointment(id);

        if (isChecked) {
            appointment.setStatus("Ya Atendido");
        } else {
            appointment.setStatus("En Espera");
        }
        
        control.editarAppointment(appointment, id);

        response.sendRedirect("SvIndex");
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
