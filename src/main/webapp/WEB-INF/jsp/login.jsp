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

        /* ---------- Background (Matched with Welcome Page) ---------- */
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
        }

        /* ---------- Floating Bubbles ---------- */
        .bubble {
            position: absolute;
            border-radius: 50%;
            background: rgba(255,255,255,0.1);
            animation: float 8s ease-in-out infinite;
        }

        .bubble:nth-child(1) {
            width: 100px; height: 100px;
            top: 10%; left: 15%;
            animation-duration: 9s;
        }

        .bubble:nth-child(2) {
            width: 150px; height: 150px;
            bottom: 15%; right: 10%;
            animation-duration: 12s;
        }

        .bubble:nth-child(3) {
            width: 80px; height: 80px;
            top: 70%; left: 25%;
            animation-duration: 10s;
        }

        .bubble:nth-child(4) {
            width: 60px; height: 60px;
            bottom: 25%; left: 10%;
            animation-duration: 11s;
        }

        @keyframes float {
            0% { transform: translateY(0) rotate(0deg); opacity: 0.6; }
            50% { transform: translateY(-20px) rotate(180deg); opacity: 1; }
            100% { transform: translateY(0) rotate(360deg); opacity: 0.6; }
        }

        /* ---------- Login Card ---------- */
        .card {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px 45px;
            width: 350px;
            border-radius: 20px;
            backdrop-filter: blur(15px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            text-align: center;
            animation: floatCard 3s ease-in-out infinite;
            z-index: 2;
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

<!-- Login Card -->
<div class="card">
    <h2>Login 🔐</h2>
    <pre>${error}</pre>
    <form method="POST">
        <label>Username</label>
        <input type="text" name="username" placeholder="Enter your name" required>

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter your password" required>

        <button type="submit">Login</button>
    </form>
</div>

</body>
</html>
