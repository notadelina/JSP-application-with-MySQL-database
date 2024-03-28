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
            background-color: rgba(255, 255, 255, 0.8);
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 20px;
        }

        p {
            text-align: center;
            margin-bottom: 20px;
            color: rgb(0, 0, 64);
            font-size: 16px;
            font-weight: bold;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
        }

        form {
            width: 95%;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            color: rgb(0, 0, 64);
        }

        table {
            width: 40%;
            margin-bottom: 20px;
            border-collapse: collapse;
            color: rgb(0, 0, 64);
            font-size: 10px; 
        }

        th, td {
            padding: 8px; 
            text-align: center;
            border: 1px solid #000;
        }

        input[type="checkbox"] {
            margin: 0 auto;
        }

        input[type="submit"] {
            padding: 8px 16px;
            background-color: #fff;
            color: rgb(0, 0, 64);
            font-weight: bold;
            text-decoration: none;
            border: 2px solid rgb(0, 0, 64);
            border-radius: 5px;
            cursor: pointer;
        }

        a[href="index.html"],
        a[href="nou_Sala.jsp"] {
            padding: 5px 10px; 
            background-color: #fff;
            color: rgb(0, 0, 64);
            font-weight: bold;
            text-decoration: none;
            border: 1px solid rgb(0, 0, 64);
            border-radius: 3px; 
            cursor: pointer;
        }

    </style>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
    <h1 align="center"> Tabela Sala:</h1>
    <br/>
    <p align="center">
        <a href="nou_Sala.jsp"><b>Adauga o noua sala.</b></a>
        <a href="index.html"><b>Home</b></a>
    </p>
    <form action="m1_Sala.jsp" method="post">
        <table border="1" align="center">
            <tr>
                <th><b>Mark:</b></th>
                <th><b>IdSala:</b></th>
                <th><b>IdCurs:</b></th>
                <th><b>NumeCurs:</b></th>
                <th><b>Dificultate:</b></th>
                <th><b>Prezenta:</b></th>
                <th><b>IdAngajat:</b></th>
                <th><b>NumeAngajat:</b></th>
                <th><b>PrenumeAngajat:</b></th>
                <th><b>Departament:</b></th>
                <th><b>Pozitie:</b></th>
                <th><b>NumeSala:</b></th>
                <th><b>Capacitate:</b></th>
                <th><b>Videoproiector:</b></th>
            </tr>
            <%
                jb.connect();
                ResultSet rs = jb.vedeSala();
                long x;
                while (rs.next()) {
                    x = rs.getInt("idsala");
            %>
            <tr>
                <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                <td><%= rs.getInt("idcursuri_sala")%></td>
                <td><%= rs.getString("NumeCurs")%></td>
                <td><%= rs.getString("Dificultate")%></td>
                <td><%= rs.getString("Prezenta")%></td>
                <td><%= rs.getInt("idangajati_sala")%></td>
                <td><%= rs.getString("NumeAngajat")%></td>
                <td><%= rs.getString("PrenumeAngajat")%></td>
                <td><%= rs.getString("Departament")%></td>
                <td><%= rs.getString("Pozitie")%></td>
                <td><%= rs.getString("NumeSala")%></td>
                <td><%= rs.getString("Capacitate")%></td>
                <td><%= rs.getString("Videoproiector")%></td>
                <%
                    }
                %>
            </tr>
        </table><br/>
        <p align="center">
            <input type="submit" value="Modifica linia">
        </p>
    </form>
    <%
        rs.close();
        jb.disconnect();
    %>
    <br/>
    <p align="center">
        <a href="index.html"><b>Home</b></a>
        <br/>
    </p>
</body>

</html>
