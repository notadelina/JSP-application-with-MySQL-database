<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tabela Angajati</title>
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
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.9);
            color: rgb(0, 0, 64);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            margin-top: 20px;
        }

        td {
            padding: 15px;
            text-align: right;
        }

        input[type="text"] {
            width: calc(100% - 30px);
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 20px;
            border: 1px solid rgb(0, 0, 64);
            border-radius: 5px;
        }

        input[type="submit"] {
            padding: 15px 30px;
            background-color: rgb(0, 0, 64);
            color: #fff;
            font-weight: bold;
            text-decoration: none;
            border: 2px solid rgb(0, 0, 64);
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #fff;
            color: rgb(0, 0, 64);
        }
    </style>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
    <h1>Tabela Angajati</h1>
    <p>
        <a href="nou_Angajat.jsp" class="btn btn-light"><b>Adauga un nou angajat</b></a>
        <a href="index.html" class="btn btn-light"><b>Home</b></a>
    </p>
    <%
        jb.connect();
        int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
        ResultSet rs = jb.intoarceLinieDupaId("angajati", "idangajati", aux);
        rs.first();
        String Nume = rs.getString("Nume");
        String Prenume = rs.getString("Prenume");
        String Departament = rs.getString("Departament");
        String Pozitie = rs.getString("Pozitie");
        rs.close();
        jb.disconnect();
    %>
    <form action="m2_Angajat.jsp" method="post">
        <table>
            <tr>
                <td align="right">IdAngajat:</td>
                <td><input type="text" name="idangajati" size="30" value="<%= aux%>" readonly/></td>
            </tr>
            <tr>
                <td align="right">Nume:</td>
                <td><input type="text" name="Nume" size="30" value="<%= Nume%>"/></td>
            </tr>
            <tr>
                <td align="right">Prenume:</td>
                <td><input type="text" name="Prenume" size="30" value="<%= Prenume%>"/></td>
            </tr>
            <tr>
                <td align="right">Departament:</td>
                <td><input type="text" name="Departament" size="30" value="<%= Departament%>"/></td>
            </tr>
            <tr>
                <td align="right">Pozitie:</td>
                <td><input type="text" name="Pozitie" size="30" value="<%= Pozitie%>"/></td>
            </tr>
        </table>
        <p>
            <input type="submit" class="btn btn-primary" value="Modifica linia">
        </p>
    </form>
    <p>
        <a href="index.html" class="btn btn-light"><b>Home</b></a>
    </p>
</body>

</html>
