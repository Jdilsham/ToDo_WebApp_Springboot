<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ToDo Dashboard</title>
    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #bbdefb);
            color: #333;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #1976d2;
            color: white;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            font-size: 22px;
            font-weight: bold;
        }

        main {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        h3 {
            color: #1976d2;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: #1976d2;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f7f9fc;
        }

        tr:hover {
            background-color: #e3f2fd;
        }

        .status-true {
            color: green;
            font-size: 18px;
        }

        .status-false {
            color: red;
            font-size: 18px;
        }

        footer {
            text-align: center;
            padding: 15px;
            color: #555;
            font-size: 14px;
        }
    </style>
</head>
<body>

<header>
    Welcome, ${username} 👋
</header>

<main>
    <h3>Your ToDos</h3>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Description</th>
            <th>Target Date</th>
            <th>Is Done</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${todos}" var="todo">
            <tr>
                <td>${todo.id}</td>
                <td>${todo.description}</td>
                <td>${todo.targetDate}</td>
                <td>
                    <c:choose>
                        <c:when test="${todo.done}">
                            <span class="status-true">✔️</span>
                        </c:when>
                        <c:otherwise>
                            <span class="status-false">❌</span>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</main>

<footer>
    © 2025 ToDo App
</footer>

</body>
</html>
