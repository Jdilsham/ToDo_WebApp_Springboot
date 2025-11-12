<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ToDo Dashboard</title>
    <style>
        /* ---------- Reset ---------- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* ---------- Background (Blue Theme + Bubbles) ---------- */
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

        /* ---------- Floating Bubbles ---------- */
        .bubble {
            position: absolute;
            border-radius: 50%;
            background: rgba(255,255,255,0.1);
            animation: float 8s ease-in-out infinite;
        }

        .bubble:nth-child(1) {
            width: 120px; height: 120px;
            top: 10%; left: 15%;
            animation-duration: 9s;
        }

        .bubble:nth-child(2) {
            width: 180px; height: 180px;
            bottom: 15%; right: 10%;
            animation-duration: 12s;
        }

        .bubble:nth-child(3) {
            width: 90px; height: 90px;
            top: 70%; left: 25%;
            animation-duration: 10s;
        }

        .bubble:nth-child(4) {
            width: 70px; height: 70px;
            bottom: 25%; left: 10%;
            animation-duration: 11s;
        }

        .bubble:nth-child(5) {
            width: 200px; height: 200px;
            top: 20%; right: 20%;
            animation-duration: 13s;
        }

        @keyframes float {
            0% { transform: translateY(0) rotate(0deg); opacity: 0.6; }
            50% { transform: translateY(-25px) rotate(180deg); opacity: 1; }
            100% { transform: translateY(0) rotate(360deg); opacity: 0.6; }
        }

        /* ---------- Header ---------- */
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
            letter-spacing: 0.5px;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        /* ---------- Main Content Card ---------- */
        main {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 40px;
            width: 90%;
            max-width: 950px;
            margin-top: 50px;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.3);
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

        /* ---------- Table ---------- */
        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.25);
            background: rgba(255, 255, 255, 0.1);
        }

        th, td {
            padding: 14px 16px;
            text-align: center;
            font-size: 16px;
        }

        th {
            background: rgba(37, 117, 252, 0.9);
            color: #fff;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        tr:nth-child(even) {
            background: rgba(255, 255, 255, 0.15);
        }

        tr:hover {
            background: rgba(255, 255, 255, 0.25);
            transition: 0.3s ease;
        }

        td {
            color: #fff;
        }

        /* ---------- Status Icons ---------- */
        .status-true {
            color: #7CFC00;
            font-size: 20px;
            text-shadow: 0 0 6px rgba(124,252,0,0.6);
        }

        .status-false {
            color: #ff6b6b;
            font-size: 20px;
            text-shadow: 0 0 6px rgba(255,107,107,0.6);
        }

        /* ---------- Button ---------- */
        .btn {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 28px;
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            color: #fff;
            font-weight: 600;
            text-decoration: none;
            border-radius: 30px;
            box-shadow: 0 5px 20px rgba(37,117,252,0.4);
            transition: all 0.3s ease;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(37,117,252,0.6);
        }

        /* ---------- Footer ---------- */
        footer {
            text-align: center;
            color: #dfe6f3;
            font-size: 14px;
            padding: 25px 0;
            margin-top: 50px;
            opacity: 0.9;
            z-index: 2;
        }
    </style>
</head>
<body>

<!-- Floating Bubbles -->
<div class="bubble"></div>
<div class="bubble"></div>
<div class="bubble"></div>
<div class="bubble"></div>
<div class="bubble"></div>

<!-- Header -->
<header>
    Welcome, ${username} 👋
</header>

<!-- Main Content -->
<main>
    <h3>Your ToDos 📋</h3>

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

    <div style="text-align:center; margin-top:30px;">
        <a href="add-todo" class="btn">➕ Add ToDo</a>
    </div>


    <div style="text-align:center;">
        <a href="login" class="btn">Logout</a>
    </div>
</main>

<!-- Footer -->
<footer>
    © 2025 ToDo App — JANITHA DILSHAM 💙
</footer>

</body>
</html>
