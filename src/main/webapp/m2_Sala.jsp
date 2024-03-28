<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Sala</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background: url('images/747506.jpg') no-repeat center center fixed;
                background-size: cover;
                color: #fff;
                font-family: 'Arial', sans-serif;
                padding: 20px;
                margin: 0;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            h1 {
                color: rgb(0, 0, 64);
                background-color: rgba(255, 255, 255, 0.9);
                padding: 15px;
                border-radius: 10px;
                text-align: center;
                margin-bottom: 20px;
            }

            p {
                text-align: center;
                margin-bottom: 20px;
                color: rgb(0, 0, 64);
            }

            a {
                background-color: rgba(255, 255, 255, 0.9);
                padding: 10px 20px;
                color: rgb(0, 0, 64);
                margin: 0 10px;
                text-decoration: none;
                border-radius: 5px;
                border: 2px solid rgb(0, 0, 64);
                transition: background-color 0.3s;
            }

            a:hover {
                background-color: rgba(255, 255, 255, 1);
            }
        </style>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Sala</h1>
        <br/>
        <p align="center">
            <a href="nou_Sala.jsp" class="btn btn-light"><b>Adauga o noua Sala</b></a>
            <a href="index.html" class="btn btn-light"><b>Home</b></a>
        </p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idsala"));
            String idcursuri = request.getParameter("idcursuri");
            String idangajati = request.getParameter("idangajati");
            String NumeSala = request.getParameter("NumeSala");
            String Capacitate = request.getParameter("Capacitate");
            String Videoproiector = request.getParameter("Videoproiector");

            String[] valori = {idcursuri, idangajati, NumeSala, Capacitate, Videoproiector};
            String[] campuri = {"idcursuri", "idangajati", "NumeSala", "Capacitate", "Videoproiector"};
            jb.modificaTabela("sala", "idsala", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="index.html" class="btn btn-light"><b>Home</b></a>
            <br/>
    </body>
</html>
