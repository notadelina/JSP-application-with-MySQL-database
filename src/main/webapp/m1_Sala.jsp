<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tabela Consultatie</title>
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
    <h1>Tabela Consultatie</h1>
    <p>
        <a href="nou_Consultatie.jsp" class="btn btn-light"><b>Adauga o noua consultatie</b></a>
        <a href="index.html" class="btn btn-light"><b>Home</b></a>
    </p>
    <%
        jb.connect();
        String NumeCurs, Dificultate, Prezenta, NumeAngajat, PrenumeAngajat, Departament, Pozitie, NumeSala, Capacitate, Videoproiector;

        int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
        ResultSet rs = jb.intoarceSalaId(aux);
        rs.first();
        int id1 = rs.getInt("idcursuri_sala");
        int id2 = rs.getInt("idangajati_sala");

        NumeCurs = rs.getString("NumeCurs");
        Dificultate = rs.getString("Dificultate");
        Prezenta = rs.getString("Prezenta");
        NumeAngajat = rs.getString("NumeAngajat");
        PrenumeAngajat = rs.getString("PrenumeAngajat");
        Departament = rs.getString("Departament");
        Pozitie = rs.getString("Pozitie");
        NumeSala = rs.getString("NumeSala");
        Capacitate = rs.getString("Capacitate");
        Videoproiector = rs.getString("Videoproiector");

        ResultSet rs1 = jb.vedeTabela("cursuri");
        ResultSet rs2 = jb.vedeTabela("angajati");
        int idcursuri, idangajati;
    %>
    <form action="m2_Sala.jsp" method="post">
        <table>
            <tr>
                <td align="right">IdSala:</td>
                <td> <input type="text" name="idsala" size="30" value="<%= aux%>" readonly/></td>
            </tr>
            <tr>
                <td align="right">idcursuri:</td>
                <td> 
                    <SELECT NAME="idcursuri">
                        <%
                            while (rs1.next()) {
                                idcursuri = rs1.getInt("idcursuri");
                                NumeCurs = rs1.getString("Nume");
                                Dificultate = rs1.getString("Dificultate");
                                Prezenta = rs1.getString("Prezenta");
                                if (idcursuri != id1) {
                        %>
                        <OPTION VALUE="<%= idcursuri%>"><%= idcursuri%>, <%= NumeCurs%>, <%= Dificultate%>, <%= Prezenta%></OPTION>
                            <%
                                    } else {
                            %>                
                        <OPTION selected="yes" VALUE="<%= idcursuri%>"><%= idcursuri%>, <%= NumeCurs%>, <%= Dificultate%>, <%= Prezenta%></OPTION>
                            <%
                                    }
                                }
                            %>
                    </SELECT>
                </td>
            </tr>
            <tr>
                <td align="right">idangajati:</td>
                <td> 
                    <SELECT NAME="idangajati">
                        <%
                            while (rs2.next()) {
                                idangajati = rs2.getInt("idangajati");
                                NumeAngajat = rs2.getString("Nume");
                                PrenumeAngajat = rs2.getString("Prenume");
                                Departament = rs2.getString("Departament");
                                Pozitie = rs2.getString("Pozitie");
                        if (idangajati != id2) {
                        %>
                        <OPTION VALUE="<%= idangajati%>"><%= idangajati%>, <%= NumeAngajat%>, <%= PrenumeAngajat%>, <%= Departament%>, <%= Pozitie%></OPTION>
                            <%
                                    } else {
                            %>                
                        <OPTION selected="yes" VALUE="<%= idangajati%>"><%= idangajati%>, <%= NumeAngajat%>, <%= PrenumeAngajat%>, <%= Departament%>, <%= Pozitie%></OPTION>
                            <%
                                    }
                                }
                            %>
                    </SELECT>
                </td>
            </tr>
            <tr>
                <td align="right">NumeSala:</td>
                <td> <input type="text" name="NumeSala" size="30" value="<%= NumeSala%>"/></td>
            </tr>
            <tr>
                <td align="right">Capacitate:</td>
                <td> <input type="text" name="Capacitate" size="30" value="<%= Capacitate%>"/></td>
            </tr>
            <tr>
                <td align="right">Videoproiector:</td>
                <td> <input type="text" name="Videoproiector" size="30" value="<%= Videoproiector%>"/></td>
            </tr>
        </table>
        <p align="center">
            <input type="submit" class="btn btn-primary" value="Modifica linia">
        </p>
    </form>
    <p align="center">
        <a href="index.html" class="btn btn-light"><b>Home</b></a>
        <br/>
    </p>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>
