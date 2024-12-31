<%@page import="com.josealmiron.logica.Appointment"%>
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
        <div class="w-full md:w-4/5 mx-auto mt-20">
            <div class="flex items-center justify-between mb-4">
                <div class="flex items-center space-x-3">
                    <h2 class="text-2xl font-bold text-white">Turnos</h2>
                    <a href="newAppointment.jsp" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">
                        Añadir
                    </a>    
                </div>

                <form action="SvAppointment" method="GET" class="flex items-center space-x-3">
                    <div>
                        <input datepicker name="date" type="text" class="bg-gray-700  border border-gray-600 text-white text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2 placeholder-gray-400" placeholder="Selecciona fecha" required>
                    </div>
                    <div>
                        <select name="status" class="bg-gray-700 border border-gray-600 text-white text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2 placeholder-gray-400">
                            <option value="" selected>No enviar nada</option>
                            <option value="En espera">En espera</option>
                            <option value="Ya atendido">Ya atendido</option>
                        </select>
                    </div>
                    <div >
                        <button type="submit" class="text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:ring-blue-800 font-medium rounded-lg text-sm px-5 py-2 focus:outline-none">
                            Filtrar
                        </button>
                    </div>
                </form>
            </div>
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
                                Acciones
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
                            if (appointments != null && !appointments.isEmpty()) {
                                for (Appointment appointment : appointments) {
                        %>
                        <tr class="odd:bg-gray-900 even:bg-gray-800 border-b border-gray-700">
                            <th class="px-6 py-4">
                                <%= appointment.getId()%>
                            </th>
                            <td class="px-6 py-4"><%= appointment.getAssignedDateFormatted()%></td>
                            <td class="px-6 py-4"><%= appointment.getDescription()%></td>
                            <td class="px-6 py-4"><%= appointment.getStatus()%></td>
                            <td class="px-6 py-4"><%= appointment.getCitizen()%></td>
                            <td class="px-6 py-4 flex items-center space-x-3">
                                <form action="SvAppointmentUpdate" method="GET">
                                    <input type="hidden" name="appointmentId" value="<%=appointment.getId()%>">
                                    <button type="submit" class="text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:ring-blue-800 font-medium rounded-lg text-sm px-5 py-2 focus:outline-none">Editar</button>    
                                </form>  
                                <form action="SvAppointmentDelete" method="POST">
                                    <input type="hidden" name="appointmentId" value="<%=appointment.getId()%>">
                                    <button type="submit" class="focus:outline-none text-white bg-red-600 hover:bg-red-700 focus:ring-4 focus:ring-red-900 font-medium rounded-lg text-sm px-5 py-2">Eliminar</button>    
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
    </body>
</html>