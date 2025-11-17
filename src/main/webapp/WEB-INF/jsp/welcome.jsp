<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <style>
        /* Background Gradient */
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #fff;
            overflow: hidden;
        }

        /* Floating Animation */
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        /* Card Container */
        .welcome-box {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            padding: 40px 60px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
            text-align: center;
            animation: float 3s ease-in-out infinite;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .welcome-box:hover {
            transform: scale(1.05);
            box-shadow: 0 15px 35px rgba(0,0,0,0.4);
        }

        /* Title */
        .welcome-box h1 {
            margin: 0 0 10px 0;
            font-size: 36px;
            letter-spacing: 1px;
            color: #fff;
        }

        /* Username Text */
        .welcome-box p {
            font-size: 18px;
            margin: 10px 0;
            color: #e0e0e0;
        }

        /* Link Button */
        .welcome-box a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            padding: 12px 25px;
            background: #fff;
            color: #2575fc;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(255,255,255,0.2);
        }

        .welcome-box a:hover {
            background: #2575fc;
            color: #fff;
            box-shadow: 0 8px 20px rgba(37,117,252,0.4);
        }

        /* Floating Background Circles */
        .circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(255,255,255,0.1);
            animation: move 10s linear infinite;
        }

        .circle:nth-child(1) {
            width: 100px;
            height: 100px;
            top: 10%;
            left: 15%;
            animation-duration: 8s;
        }

        .circle:nth-child(2) {
            width: 150px;
            height: 150px;
            bottom: 15%;
            right: 10%;
            animation-duration: 12s;
        }

        .circle:nth-child(3) {
            width: 80px;
            height: 80px;
            top: 70%;
            left: 25%;
            animation-duration: 10s;
        }

        @keyframes move {
            0% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
            100% { transform: translateY(0) rotate(360deg); }
        }
    </style>
</head>
<body>

<!-- Floating Decorative Circles -->
<div class="circle"></div>
<div class="circle"></div>
<div class="circle"></div>

<!-- Main Card -->
<div class="welcome-box">
    <h1>Welcome 👋</h1>
    <p>Name: <strong>${username}</strong></p>
    <a href="list-todos">Manage Your ToDos</a>
</div>

</body>
</html>
