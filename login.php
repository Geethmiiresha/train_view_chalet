<?php 
include('config/db.php'); // Database එක මෙතැනට සම්බන්ධ කරයි
session_start(); 
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Train View Chalet Hotel - Secure Access Portal</title>
    <style>
        body { font-family: sans-serif; background-color: #0b1f31; color: white; margin: 0; display: flex; flex-direction: column; align-items: center; }
        .header { text-align: center; padding: 20px; font-size: 24px; font-weight: bold; }
        .container { display: flex; gap: 20px; padding: 20px; }
        .card { width: 300px; background: #fff; color: #333; padding: 20px; border-radius: 8px; }
        .staff-admin { background: #d31414; color: white; padding: 20px; border-radius: 8px; width: 300px; }
        input { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background: #008080; color: white; border: none; border-radius: 4px; cursor: pointer; }
        .footer { margin-top: 20px; font-size: 12px; }
        img { width: 100%; border-radius: 4px; }
    </style>
</head>
<body>

<div class="header">TRAIN VIEW CHALET HOTEL - SECURE ACCESS PORTAL</div>

<div class="container">
    <!-- Customer Login -->
    <div class="card">
        <h3>CUSTOMER LOGIN</h3>
        <img src="hotel_room.jpg" alt="Hotel View">
        <form>
            <input type="email" placeholder="Email">
            <input type="password" placeholder="Password">
            <button>Sign In</button>
        </form>
        <p><a href="#">Create Account</a> | <a href="#">Forgot Password?</a></p>
    </div>

    <!-- Staff Login -->
    <div class="staff-admin">
        <h3>STAFF LOGIN</h3>
        <form>
            <input type="text" placeholder="Staff ID">
            <input type="password" placeholder="Password">
            <button>Sign In</button>
        </form>
        <p style="text-align:center;">Quick Check-in (QR Placeholder)</p>
    </div>

    <!-- Admin Login -->
    <div class="staff-admin">
        <h3>ADMIN DASHBOARD</h3>
        <form>
            <input type="text" placeholder="Admin Username">
            <input type="password" placeholder="Secure Passcode">
            <button>Sign In</button>
        </form>
    </div>
</div>

<div class="footer">&copy; SLIATE HNDIT Project - Powered by AI-Smart Systems</div>

</body>
</html>