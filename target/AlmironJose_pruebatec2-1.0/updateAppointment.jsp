<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.josealmiron.logica.Appointment"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.josealmiron.logica.Citizen"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
        <title>TurnerApp</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <%
            Appointment appointment = (Appointment) session.getAttribute("appointmentEdit");

            LocalDateTime assignedDate = appointment.getAssignedDate();

            DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
            DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");

            String datePart = assignedDate.format(dateFormatter); // "yyyy-MM-dd"
            String timePart = assignedDate.format(timeFormatter); // "HH:mm"
        %>
        <div class="w-full md:w-4/5 mx-auto mt-20">
            <div class="font-sans">
                <div class="relative  flex flex-col sm:justify-center items-center">
                    <div class="relative sm:max-w-sm w-full">
                        <div class="card bg-blue-400 shadow-lg  w-full h-full rounded-3xl absolute  transform -rotate-6"></div>
                        <div class="card bg-red-400 shadow-lg  w-full h-full rounded-3xl absolute  transform rotate-6"></div>
                        <div class="relative w-full rounded-3xl  px-6 py-4 bg-gray-800 shadow-md">
                            <form action="SvAppointmentUpdate" method="POST">
                                <h1 class="text-white text-center text-2xl font-semibold mb-4">Nuevo Turno</h1>
                                <div class="mb-3">
                                    <label for="date" class="block mb-2 text-sm font-medium text-white">Fecha</label>
                                    <input id="datepickerId" value="<%= datePart%>" datepicker name="date" type="text" class="bg-gray-700  border border-gray-600 text-white text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2 placeholder-gray-400" placeholder="Selecciona fecha">
                                </div>
                                <div class="mb-3">
                                    <label for="time" class="block mb-2 text-sm font-medium text-white">Hora (09:00 - 18:00)</label>
                                    <input type="time" value="<%= timePart%>" name="time" class="bg-gray-700 border leading-none border-gray-600 text-white text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2  placeholder-gray-400" min="09:00" max="18:00" value="00:00" required />
                                </div>
                                <div class="mb-3">
                                    <label for="status" class="block mb-2 text-sm font-medium text-white">Estado</label>
                                    <select name="status" class="bg-gray-700 border border-gray-600 text-white text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2 placeholder-gray-400">
                                        <option value="<%= appointment.getStatus()%>" selected><%= appointment.getStatus()%></option>
                                        <%
                                            String[] statuses = {"En Espera", "Ya Atendido"};

                                            for (String status : statuses) {
                                                if (!status.equals(appointment.getStatus())) {
                                        %>
                                        <option value="<%= status%>"><%= status%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="citizen" class="block mb-2 text-sm font-medium text-white">Ciudadanos</label>
                                    <select name="citizen" class="bg-gray-700 border border-gray-600 text-white text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2 placeholder-gray-400">
                                        <%
                                            List<Citizen> citizens = (List<Citizen>) session.getAttribute("citizens");
                                            if (citizens != null) {
                                                for (Citizen citizen : citizens) {
                                                    boolean isSelected = citizen.getId() == appointment.getCitizen().getId();
                                        %>
                                        <option value="<%= citizen.getId()%>" <%= isSelected ? "selected" : ""%>>
                                            <%= citizen.getName()%> <%= citizen.getSurname()%>
                                        </option>
                                        <%
                                            }
                                        } else {
                                        %>
                                        <option disabled>No hay ciudadanos disponibles</option>
                                        <% }%>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="description" class="block mb-2 text-sm font-medium text-white">Descripción</label>
                                    <textarea name="description" rows="4" class="block p-2 w-full text-sm text-white bg-gray-700 rounded-lg border border-gray-600 focus:ring-blue-500 focus:border-blue-500 placeholder-gray-400" placeholder="Descripción..."><%= appointment.getDescription().trim() %></textarea>
                                </div>
                                <div class="mt-5 mb-5">
                                    <button type="submit" class="bg-blue-500 w-full py-3 rounded-xl text-white shadow-xl hover:shadow-inner focus:outline-none transition duration-500 ease-in-out  transform hover:-translate-x hover:scale-105">
                                        Añadir
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>