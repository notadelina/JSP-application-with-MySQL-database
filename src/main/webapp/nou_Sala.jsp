<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Adauga sala</title>
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
    <h1> Suntem in tabela sala.</h1>

    <%
        int idcursuri, idangajati;
        String id1, id2, NumeCurs, Dificultate, Prezenta, NumeAngajat, PrenumeAngajat, Departament, Pozitie, NumeSala, Capacitate, Videoproiector;
        id1 = request.getParameter("idcursuri");
        id2 = request.getParameter("idangajati");
        NumeSala = request.getParameter("NumeSala");
        Capacitate = request.getParameter("Capacitate");
        Videoproiector = request.getParameter("Videoproiector");
        if (id1 != null) {
            jb.connect();
            jb.adaugaSala(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), NumeSala, Capacitate, Videoproiector);
            jb.disconnect();
    %>
    <p>Datele au fost adaugate.</p><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("cursuri");
        ResultSet rs2 = jb.vedeTabela("angajati");
        %>
        <form action="nou_Sala.jsp" method="post">
            <table>
                <tr>
                    <td align="right">IdCurs:</td>
                    <td>
                        Selectati cursul:
                        <SELECT NAME="idcursuri">
                            <%
                                while(rs1.next()){
                                    idcursuri = rs1.getInt("idcursuri");
                                    NumeCurs = rs1.getString("Nume");
                                    Dificultate = rs1.getString("Dificultate");
                                    Prezenta = rs1.getString("Prezenta");
                            %>
                                <OPTION VALUE="<%= idcursuri%>"><%= idcursuri%>,<%= NumeCurs%>,<%= Dificultate%>,<%= Prezenta%></OPTION>
                            <%
                                }
                            %>
                        </SELECT>
                    </td>
                </tr>
                <tr>
                    <td align="right">idangajati:</td>
                    <td>
                        Selectati angajatul:
                        <SELECT NAME="idangajati">
                            <!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                            <%
                                while(rs2.next()){
                                    idangajati = rs2.getInt("idangajati");
                                    NumeAngajat = rs2.getString("Nume");
                                    PrenumeAngajat = rs2.getString("Prenume");
                                    Departament = rs2.getString("Departament");
                                    Pozitie = rs2.getString("Pozitie");
                            %>
                                <OPTION VALUE="<%= idangajati%>"><%= idangajati%>,<%= NumeAngajat%>,<%= PrenumeAngajat%>,<%= Departament%>, <%= Pozitie%></OPTION>
                            <%
                                }
                            %>
                        </SELECT>
                    </td>
                </tr>
                <tr>
                    <td align="right">Nume Sala:</td>
                    <td> <input type="text" name="NumeSala" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Capacitate:</td>
                    <td> <input type="text" name="Capacitate" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Videoproiector:</td>
                    <td> <input type="text" name="Videoproeictor" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga sala" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>
