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
            <div class="font-sans">
                <div class="relative  flex flex-col sm:justify-center items-center">
                    <div class="relative sm:max-w-sm w-full">
                        <div class="card bg-blue-400 shadow-lg  w-full h-full rounded-3xl absolute  transform -rotate-6"></div>
                        <div class="card bg-red-400 shadow-lg  w-full h-full rounded-3xl absolute  transform rotate-6"></div>
                        <div class="relative w-full rounded-3xl  px-6 py-4 bg-gray-800 shadow-md">
                            <form action="SvCitizen" method="POST">
                                <h1 class="text-white text-center text-2xl font-semibold mb-4">Nuevo Ciudadano</h1>
                                <div class="mb-3">
                                    <label for="name" class="block mb-2 text-sm font-medium text-white">Nombre</label>
                                    <input type="text" name="name" class="bg-gray-700  border border-gray-600  text-white text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2 placeholder-gray-400" placeholder="Peter" required />
                                </div>
                                <div class="mb-3">
                                    <label for="surname" class="block mb-2 text-sm font-medium text-white">Apellidos</label>
                                    <input type="text" name="surname" class="bg-gray-700  border border-gray-600  text-white text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2 placeholder-gray-400" placeholder="Anthony" required />
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="block mb-2 text-sm font-medium text-white">Correo electronico</label>
                                    <input type="email" name="email" class="bg-gray-700  border border-gray-600  text-white text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2 placeholder-gray-400" placeholder="peter@anthony.com" required />
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="block mb-2 text-sm font-medium text-white">Telefono</label>
                                    <input type="text" name="phone" class="bg-gray-700  border border-gray-600  text-white text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2 placeholder-gray-400" placeholder="000 00 00 00" required />
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
