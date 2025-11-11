<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            height: 100vh;
            width: 100vw;
            display: flex;
            justify-content: center;
            align-items: center; /* ✅ This perfectly centers the card */
            background: linear-gradient(135deg, #3b6ea8, #1e3a5f);
        }

        .card {
            background: rgba(255, 255, 255, 0.15);
            padding: 30px 35px;
            width: 350px;
            border-radius: 14px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.25);
        }

        .card h2 {
            text-align: center;
            margin-bottom: 20px;
            color: white;
            font-weight: 600;
        }

        label {
            margin-top: 12px;
            display: block;
            font-size: 14px;
            color: white;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-top: 6px;
            border-radius: 8px;
            border: none;
            background: rgba(255,255,255,0.3);
            color: white;
        }

        input::placeholder {
            color: #e0e0e0;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 18px;
            background: #00c6ff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            color: #000;
            transition: 0.3s;
        }

        button:hover {
            background: #05aef0;
        }
    </style>
</head>

<body>

<div class="card">
    <h2>Login</h2>
    <pre>${error}</pre>
    <form method="POST">
        <label>Name</label>
        <input type="text" name="username" placeholder="Enter your name" required>

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter your password" required>

        <button type="submit">Login</button>
    </form>
</div>

</body>
</html>
