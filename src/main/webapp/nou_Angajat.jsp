<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Adauga Angajat</title>
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
            font-size: 18px;
            font-weight: bold;
            background-color: rgba(255, 255, 255, 0.8); 
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
        }

        form {
            width: 60%;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.8); 
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            color: rgb(0, 0, 64);
        }

        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
            color: rgb(0, 0, 64); 
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 2px solid #fff; 
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        a[href="index.html"] {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 5px 10px;
            color: rgb(0, 0, 64);
            margin: 0 10px;
            text-decoration: none;
            border-radius: 5px;
            border: 2px solid rgb(0, 0, 64);
        }

        a[href="index.html"]:hover {
            background-color: rgb(0, 0, 64);
            color: #fff;
        }

        input[type="submit"] {
            background-color: #fff;
            color: rgb(0, 0, 64);
            font-weight: bold;
            text-decoration: none;
            border: 2px solid rgb(0, 0, 64);
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
    </style>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
    <h1> Suntem in tabela Angajat</h1>

    <%
        String Nume = request.getParameter("Nume");
        String Prenume = request.getParameter("Prenume");
        String Departament = request.getParameter("Departament");
        String Pozitie = request.getParameter("Pozitie");
        if (Nume != null) {
            jb.connect();
            jb.adaugaAngajat(Nume, Prenume, Departament, Pozitie);
            jb.disconnect();
    %>
    <p>Datele au fost adaugate cu succes!</p>
    <%
        } else {
    %>
    <form action="nou_Angajat.jsp" method="post">
        <table>
            <tr>
                <th>Nume Angajat</th>
                <th>Prenume Angajat</th>
                <th>Departament</th>
                <th>Pozitie</th>
            </tr>
            <tr>
                <td><input type="text" name="Nume" /></td>
                <td><input type="text" name="Prenume" /></td>
                <td><input type="text" name="Departament" /></td>
                <td><input type="text" name="Pozitie" /></td>
            </tr>
        </table>
        <input type="submit" value="Adauga angajatul" />
    </form>
    <%
        }
    %>

    <br/>
    <a href="index.html"><b>Home</b></a>
    <br/>
</body>

</html>
