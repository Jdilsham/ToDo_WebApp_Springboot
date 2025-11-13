<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ToDo Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            color: #fff;
            overflow: hidden;
            position: relative;
        }

        .bubble {
            position: absolute;
            border-radius: 50%;
            background: rgba(255,255,255,0.1);
            animation: float 8s ease-in-out infinite;
        }

        .bubble:nth-child(1) { width: 120px; height: 120px; top: 10%; left: 15%; animation-duration: 9s; }
        .bubble:nth-child(2) { width: 180px; height: 180px; bottom: 15%; right: 10%; animation-duration: 12s; }
        .bubble:nth-child(3) { width: 90px; height: 90px; top: 70%; left: 25%; animation-duration: 10s; }
        .bubble:nth-child(4) { width: 70px; height: 70px; bottom: 25%; left: 10%; animation-duration: 11s; }
        .bubble:nth-child(5) { width: 200px; height: 200px; top: 20%; right: 20%; animation-duration: 13s; }

        @keyframes float {
            0% { transform: translateY(0) rotate(0deg); opacity: 0.6; }
            50% { transform: translateY(-25px) rotate(180deg); opacity: 1; }
            100% { transform: translateY(0) rotate(360deg); opacity: 0.6; }
        }

        header {
            width: 100%;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            color: #fff;
            padding: 25px 0;
            text-align: center;
            font-size: 26px;
            font-weight: 600;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            position: sticky;
            top: 0;
            z-index: 10;
        }

        main {
            background: rgba(255, 255, 255, 0.12);
            backdrop-filter: blur(25px);
            border-radius: 25px;
            padding: 50px;
            width: 90%;
            max-width: 950px;
            margin-top: 50px;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.35);
            animation: fadeIn 0.8s ease-in-out;
            z-index: 2;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h3 {
            color: #fff;
            font-size: 26px;
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
            text-shadow: 0 2px 6px rgba(0,0,0,0.3);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 15px;
            overflow: hidden;
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.25);
            text-align: center;
        }

        th, td {
            padding: 14px 16px;
            font-size: 16px;
            vertical-align: middle;
        }

        th {
            background: rgba(37, 117, 252, 0.9);
            color: #fff;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        tr:nth-child(even) { background: rgba(255, 255, 255, 0.15); }
        tr:hover { background: rgba(255, 255, 255, 0.25); transition: background 0.3s ease; }

        th:nth-child(1), td:nth-child(1) { width: 8%; }
        th:nth-child(2), td:nth-child(2) { width: 38%; text-align: left; padding-left: 25px; }
        th:nth-child(3), td:nth-child(3) { width: 20%; }
        th:nth-child(4), td:nth-child(4) { width: 14%; }
        th:nth-child(5), td:nth-child(5) { width: 20%; }

        .status-true { color: #7CFC00; font-size: 20px; text-shadow: 0 0 6px rgba(124,252,0,0.6); }
        .status-false { color: #ff6b6b; font-size: 20px; text-shadow: 0 0 6px rgba(255,107,107,0.6); }

        /* ---------- Action Buttons ---------- */
        td.actions {
            white-space: nowrap;
            text-align: center;
        }

        .action-btn {
            display: inline-block;
            margin: 0 5px;
            padding: 8px 16px;
            border-radius: 25px;
            font-weight: 600;
            font-size: 14px;
            color: #fff;
            text-decoration: none;
            transition: all 0.3s ease;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            box-shadow: 0 3px 15px rgba(37, 117, 252, 0.4);
        }

        /* Update Button */
        .btn-update:hover {
            background: linear-gradient(135deg, #00c9a7, #92fe9d); /* 🌿 Green hover */
            box-shadow: 0 6px 25px rgba(0, 255, 153, 0.5);
            transform: translateY(-2px) scale(1.05);
        }

        /* Delete Button */
        .btn-delete:hover {
            background: linear-gradient(135deg, #ff416c, #ff4b2b); /* 🔥 Red hover */
            box-shadow: 0 6px 25px rgba(255, 77, 77, 0.6);
            transform: translateY(-2px) scale(1.05);
        }

        /* ---------- Add & Logout Buttons ---------- */
        .btn-add, .btn-logout {
            display: inline-block;
            padding: 12px 28px;
            margin-top: 25px;
            font-weight: 600;
            text-decoration: none;
            border-radius: 30px;
            box-shadow: 0 5px 20px rgba(37,117,252,0.4);
            transition: all 0.3s ease;
        }

        .btn-add { background: linear-gradient(135deg, #2575fc, #6a11cb); }
        .btn-add:hover {
            background: linear-gradient(135deg, #00c9a7, #92fe9d);
            box-shadow: 0 8px 35px rgba(0, 255, 153, 0.5);
            transform: translateY(-2px) scale(1.05);
        }

        .btn-logout { background: linear-gradient(135deg, #2575fc, #6a11cb); }
        .btn-logout:hover {
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            box-shadow: 0 8px 30px rgba(255, 77, 77, 0.6);
            transform: translateY(-2px) scale(1.05);
        }

        footer {
            text-align: center;
            color: #dfe6f3;
            font-size: 14px;
            padding: 25px 0;
            margin-top: 50px;
            opacity: 0.9;
        }

        button {
            border: none;
            outline: none;
        }

        button:focus {
            outline: none;
            box-shadow: none;
        }

    </style>
</head>

<body>
<div class="bubble"></div><div class="bubble"></div><div class="bubble"></div><div class="bubble"></div><div class="bubble"></div>

<header>Welcome, ${username} 👋</header>

<main>
    <h3>Your ToDos 📋</h3>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Description</th>
            <th>Target Date</th>
            <th>Is Done</th>
            <th>Action</th>
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
                <td class="actions">
                    <a href="update-todo?id=${todo.id}" class="action-btn btn-update">Update</a>
                    <a href="delete-todo?id=${todo.id}" class="action-btn btn-delete"
                       onclick="return confirm('Are you sure you want to delete this task?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div style="text-align:center; margin-top:30px;">
        <a href="add-todo" class="btn-add">➕ Add ToDo</a>
    </div>

    <div style="text-align:center;">
        <form action="/perform_logout" method="POST">
            <button type="submit" class="btn-logout">Logout</button>
        </form>
    </div>
</main>

<footer>© 2025 ToDo App — JANITHA DILSHAM 💙</footer>
</body>
</html>
