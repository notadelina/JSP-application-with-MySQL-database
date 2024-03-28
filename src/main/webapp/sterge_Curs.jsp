<%-- 
    Document   : sterge_Pacient
    Created on : Nov 14, 2016, 1:32:42 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sterge Curs</title>
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

        a {
            text-decoration: none;
            color: rgb(0, 0, 64);
            font-weight: bold;
            background-color: rgba(255, 255, 255, 0.8); 
            padding: 10px 20px;
            border-radius: 5px;
            display: inline-block;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
        }
    </style>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
    <%
        String[] s = request.getParameterValues("primarykey");
        jb.connect();
        jb.stergeDateTabela(s, "cursuri", "idcursuri");
        jb.disconnect();
    %>
    <p>Datele au fost sterse cu succes!</p>
    <a href="index.html"><b>Home</b></a>
    <br/>
</body>

</html>
