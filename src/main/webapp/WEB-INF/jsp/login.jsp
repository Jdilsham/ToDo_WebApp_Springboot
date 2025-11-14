<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        /* ---------- Reset ---------- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* ---------- Background (Blue Gradient) ---------- */
        body {
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            width: 100vw;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            overflow: hidden;
            color: white;
            position: relative;
        }

        /* ---------- Animated Bubbles ---------- */
        .bubble {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.15);
            animation: moveBubble linear infinite;
            mix-blend-mode: screen;
        }

        /* Different bubble sizes and durations */
        .bubble:nth-child(1) {
            width: 100px; height: 100px;
            left: 10%; top: 20%;
            animation-duration: 18s;
            animation-delay: 0s;
        }

        .bubble:nth-child(2) {
            width: 150px; height: 150px;
            left: 70%; top: 30%;
            animation-duration: 25s;
            animation-delay: 3s;
        }

        .bubble:nth-child(3) {
            width: 80px; height: 80px;
            left: 20%; top: 70%;
            animation-duration: 20s;
            animation-delay: 1s;
        }

        .bubble:nth-child(4) {
            width: 120px; height: 120px;
            left: 60%; top: 80%;
            animation-duration: 22s;
            animation-delay: 2s;
        }

        .bubble:nth-child(5) {
            width: 180px; height: 180px;
            left: 40%; top: 10%;
            animation-duration: 30s;
            animation-delay: 4s;
        }

        /* ---------- Bubble Motion Keyframes ---------- */
        @keyframes moveBubble {
            0% {
                transform: translate(0, 0) scale(1) rotate(0deg);
                opacity: 0.7;
            }
            25% {
                transform: translate(60px, -40px) scale(1.1) rotate(90deg);
                opacity: 0.9;
            }
            50% {
                transform: translate(-30px, 60px) scale(0.95) rotate(180deg);
                opacity: 0.6;
            }
            75% {
                transform: translate(-60px, -40px) scale(1.05) rotate(270deg);
                opacity: 0.8;
            }
            100% {
                transform: translate(0, 0) scale(1) rotate(360deg);
                opacity: 0.7;
            }
        }

        /* ---------- Login Card ---------- */
        .card {
            background: rgba(255, 255, 255, 0.12);
            padding: 40px 45px;
            width: 350px;
            border-radius: 20px;
            backdrop-filter: blur(15px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.3);
            text-align: center;
            z-index: 2;
            animation: floatCard 3s ease-in-out infinite;
        }

        @keyframes floatCard {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-8px); }
        }

        .card h2 {
            margin-bottom: 20px;
            font-size: 30px;
            font-weight: 700;
            color: #fff;
        }

        pre {
            color: #ffb3b3;
            font-size: 14px;
            text-align: center;
            margin-bottom: 10px;
        }

        label {
            display: block;
            text-align: left;
            margin-top: 14px;
            font-size: 14px;
            color: #fff;
            letter-spacing: 0.3px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-top: 6px;
            border-radius: 8px;
            border: none;
            background: rgba(255,255,255,0.25);
            color: #fff;
            outline: none;
            font-size: 15px;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        input::placeholder {
            color: #e0e0e0;
        }

        input:focus {
            background: rgba(255,255,255,0.35);
            transform: scale(1.02);
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 22px;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            letter-spacing: 0.5px;
            box-shadow: 0 5px 20px rgba(37,117,252,0.4);
            transition: all 0.3s ease;
        }

        button:hover {
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            box-shadow: 0 8px 25px rgba(106,17,203,0.5);
            transform: translateY(-2px);
        }

        /* ---------- Glow Border ---------- */
        .card::before {
            content: "";
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            border-radius: 22px;
            background: linear-gradient(45deg, rgba(37,117,252,0.6), rgba(106,17,203,0.3));
            z-index: -1;
            opacity: 0.3;
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

<!-- Login Card -->
<div class="card">
    <h2>Login 🔐</h2>
    <form action="/perform_login" method="POST">
        <c:if test="${not empty errorMessage}">
            <div style="color: red; font-weight: bold; margin-bottom: 10px;">
                    ${errorMessage}
            </div>
        </c:if>


        <label>Username</label>
        <input type="text" name="username" placeholder="Enter your name" required>

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter your password" required>

        <button type="submit">Login</button>
    </form>
</div>

</body>
</html>
