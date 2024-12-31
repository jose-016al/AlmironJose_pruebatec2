package com.josealmiron.servlets;

import com.josealmiron.logica.Appointment;
import com.josealmiron.logica.Citizen;
import com.josealmiron.logica.Controladora;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvAppointment", urlPatterns = {"/SvAppointment"})
public class SvAppointment extends HttpServlet {

    private Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String dateParam = request.getParameter("date"); 
        String statusParam = request.getParameter("status"); 

        System.out.println(dateParam);
        System.out.println(statusParam);

        List<Appointment> appointments = control.traerAppointments();

        if (request.getSession().getAttribute("citizens") == null) {
            List<Citizen> listCitizens = control.traerCitizens();
            request.getSession().setAttribute("citizens", listCitizens);
        }

        if (dateParam == null && statusParam == null) {
            request.setAttribute("appointments", appointments);
        } else {
            if (dateParam != null && !dateParam.isEmpty()) {
                DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
                LocalDate localDate = LocalDate.parse(dateParam, dateFormatter);

                List<Appointment> filteredAppointments = appointments.stream()
                        .filter(a -> a.getAssignedDate().toLocalDate().equals(localDate))
                        .sorted(Comparator.comparing(Appointment::getAssignedDate))
                        .collect(Collectors.toList());

                if (statusParam != null && !statusParam.isEmpty()) {
                    filteredAppointments = filteredAppointments.stream()
                            .filter(a -> a.getStatus().equalsIgnoreCase(statusParam))
                            .collect(Collectors.toList());
                }

                request.setAttribute("appointments", filteredAppointments);
            }

        }

        request.getRequestDispatcher("appointment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String citizen = request.getParameter("citizen");
        String description = request.getParameter("description");

        try {

            DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");

            LocalDate localDate = LocalDate.parse(date, dateFormatter);
            LocalTime localTime = LocalTime.parse(time);

            LocalDateTime dateTime = LocalDateTime.of(localDate, localTime);

            Appointment appointment = new Appointment();
            appointment.setAssignedDate(dateTime);
            appointment.setStatus("En espera");
            appointment.setDescription(description);

            control.crearAppointment(appointment, Long.parseLong(citizen));

            response.sendRedirect("SvAppointment");
        } catch (Exception e) {
            Logger.getLogger(SvAppointment.class.getName()).log(Level.SEVERE, "Error al crear la cita", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Ocurrió un error al procesar la solicitud.");
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
