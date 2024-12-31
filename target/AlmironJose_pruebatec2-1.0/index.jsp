<%@page import="com.josealmiron.logica.Appointment"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
        <title>TurnerApp</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="w-full md:w-4/5 mx-auto mt-20">
            <h2 class="text-2xl font-bold text-white">Turnos de hoy</h2>
            <div class="relative overflow-x-auto sm:rounded-lg w-full mt-3">
                <table class="w-full text-sm text-left rtl:text-right text-gray-400">
                    <thead class="text-xs text-gray-400 uppercase bg-gray-700">
                        <tr>
                            <th scope="col" class="px-6 py-3">
                                ID
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Fecha
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Descripción
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Estado
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Ciudadano
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Cambiar estado
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Appointment> appointments = (List<Appointment>) session.getAttribute("todaysAppointments");
                            if (appointments != null && !appointments.isEmpty()) {
                                for (Appointment appointment : appointments) {
                                    System.out.println(appointment.getStatus());
                        %>
                        <tr class="odd:bg-gray-900 even:bg-gray-800 border-b border-gray-700">
                            <th class="px-6 py-4">
                                <%= appointment.getId()%>
                            </th>
                            <td class="px-6 py-4"><%= appointment.getAssignedDateFormatted()%></td>
                            <td class="px-6 py-4"><%= appointment.getDescription()%></td>
                            <td class="px-6 py-4"><%= appointment.getStatus()%></td>
                            <td class="px-6 py-4"><%= appointment.getCitizen()%></td>
                            <td class="px-6 py-4">
                                <form action="SvIndex" method="POST" class="flex justify-center items-center">
                                    <input type="hidden" name="appointmentId" value="<%= appointment.getId()%>">

                                    <input type="checkbox" name="status" class="w-5 h-5 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                                           <%= appointment.getStatus().equals("Ya Atendido") ? "checked" : ""%> />
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="5" class="text-center py-4 text-gray-500">No hay turnos disponibles</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <script>
            document.querySelectorAll('input[type="checkbox"]').forEach(function (toggle) {
                toggle.addEventListener('change', function () {
                    this.closest('form').submit();
                });
            });
        </script>
    </body>
</html>