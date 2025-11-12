<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            background: #f0f0f0;
        }

        .welcome-box {
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            text-align: center;
        }

        .welcome-box h1 {
            margin: 0;
            font-size: 28px;
            color: #333;
        }
    </style>
</head>

<body>
<div class="welcome-box">
    <h1>Welcome</h1>

    <p>Name: ${username}</p>

    <p><a href="list-totos">Manege Your ToDos</a></p>
</div>

</body>
</html>
