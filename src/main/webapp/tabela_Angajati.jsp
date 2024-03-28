<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java"
    import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

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
        }

       a {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 5px 10px;
            color: rgb(0, 0, 64);
            margin: 0 10px;
            text-decoration: none;
            border-radius: 5px;
        }

        input[type="submit"],
        a[href="index.html"],
        a[href="nou_Angajat.jsp"] {
            padding: 10px 20px;
            background-color: #fff;
            color: rgb(0, 0, 64);
            font-weight: bold;
            text-decoration: none;
            border: 2px solid rgb(0, 0, 64);
            border-radius: 5px;
            cursor: pointer;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.8);
            color: rgb(0, 0, 64); 
        }

        th, td {
            padding: 15px;
            text-align: center;
            border: 1px solid #000; 
        }

        input[type="checkbox"] {
            margin: 0 auto;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #fff;
            color: rgb(0, 0, 64);
            font-weight: bold;
            text-decoration: none;
            border: 2px solid rgb(0, 0, 64);
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
    <h1>Tabela Angajati</h1>
    <p>
        <a href="nou_Angajat.jsp"><b>Adauga un nou angajat</b></a>
        <a href="index.html"><b>Home</b></a>
    </p>
    <form action="sterge_Angajat.jsp" method="post">
        <table>
            <tr>
                <th><b>Mark:</b></th>
                <th><b>IdAngajat:</b></th>
                <th><b>Nume:</b></th>
                <th><b>Prenume:</b></th>
                <th><b>Departament:</b></th>
                <th><b>Pozitie:</b></th>
            </tr>
            <%
                jb.connect();
                ResultSet rs = jb.vedeTabela("angajati");
                long x;
                while (rs.next()) {
                    x = rs.getInt("idangajati");
            %>
            <tr>
                <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                <td><%= rs.getString("Nume")%></td>
                <td><%= rs.getString("Prenume")%></td>
                <td><%= rs.getString("Departament")%></td>
                <td><%= rs.getString("Pozitie")%></td>
                <%
                    }
                %>
            </tr>
        </table>
        <br />
        <p>
            <input type="submit" value="Sterge liniile marcate">
        </p>
    </form>
    <%
        rs.close();
        jb.disconnect();
    %>
    <br />
    <p>
        <a href="index.html"><b>Home</b></a> <br />
    </p>
</body>

</html>
