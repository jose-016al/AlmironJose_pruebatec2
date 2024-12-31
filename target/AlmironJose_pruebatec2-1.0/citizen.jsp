<%@page import="com.josealmiron.logica.Citizen"%>
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
            <div class="flex items-center justify-between mb-4">
                <h2 class="text-2xl font-bold text-white">Ciudadanos</h2>
                <a href="newCitizen.jsp" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">
                    Añadir
                </a>
            </div>
            <div class="relative overflow-x-auto sm:rounded-lg w-full mt-3">
                <table class="w-full text-sm text-left rtl:text-right text-gray-400">
                    <thead class="text-xs text-gray-400 uppercase bg-gray-700">
                        <tr>
                            <th scope="col" class="px-6 py-3">
                                ID
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Nombre
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Apellidos
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Email
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Telefono
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Acciones
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Citizen> citizens = (List<Citizen>) session.getAttribute("citizens");
                            if (citizens != null && !citizens.isEmpty()) {
                                for (Citizen citizen : citizens) {
                        %>
                        <tr class="odd:bg-gray-900 even:bg-gray-800 border-b border-gray-700">
                            <th class="px-6 py-4">
                                <%= citizen.getId()%>
                            </th>
                            <td class="px-6 py-4"><%= citizen.getName()%></td>
                            <td class="px-6 py-4"><%= citizen.getSurname()%></td>
                            <td class="px-6 py-4"><%= citizen.getEmail()%></td>
                            <td class="px-6 py-4"><%= citizen.getPhone()%></td>
                            <td class="px-6 py-4 flex items-center space-x-3">
                                <form action="SvCitizenUpdate" method="GET">
                                    <input type="hidden" name="citizenId" value="<%=citizen.getId()%>">
                                    <button type="submit" class="text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:ring-blue-800 font-medium rounded-lg text-sm px-5 py-2 focus:outline-none">Editar</button>    
                                </form>  
                                <form action="SvCitizenDelete" method="POST">
                                    <input type="hidden" name="citizenId" value="<%=citizen.getId()%>">
                                    <button type="submit" class="focus:outline-none text-white bg-red-600 hover:bg-red-700 focus:ring-4 focus:ring-red-900 font-medium rounded-lg text-sm px-5 py-2">Eliminar</button>    
                                </form>                        
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="5" class="text-center py-4 text-gray-500">No hay ciudadanos disponibles</td>
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
