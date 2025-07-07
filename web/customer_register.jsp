<%-- 
    Document   : customer_register
    Created on : Jul 5, 2025, 5:06:21 PM
    Author     : Nuradibah Maisarah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Customer Registration</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #f0f7ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 10px;
          }

          .register-form {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 30px;
            width: 360px;
            box-sizing: border-box;
            border: 1px solid #cbd5e1;
          }

          h2 {
            color: #1e3a8a;
            text-align: center;
            margin-bottom: 25px;
            font-size: 24px;
          }

          .form-group {
            margin-bottom: 18px;
          }

          label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #1f2937;
          }

          input[type="text"],
          input[type="email"],
          input[type="tel"],
          input[type="password"],
          select {
            width: 100%;
            padding: 10px 12px;
            border: 1.5px solid #cbd5e1;
            border-radius: 6px;
            font-size: 15px;
            color: #1f2937;
            box-sizing: border-box;
          }

          input[type="text"]:focus,
          input[type="email"]:focus,
          input[type="tel"]:focus,
          select:focus {
            border-color: #3b82f6;
            outline: none;
            background-color: #f9fbfe;
          }

          .submit-btn {
            width: 100%;
            background-color: #f97316;
            color: white;
            border: none;
            padding: 13px 0;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 10px;
          }

          .submit-btn:hover {
            background-color: #fb923c;
          }
        </style>
    </head>
    <body>

        <form class="register-form" action="CustRegisterServlet" method="POST">
            <h2>Customer Registration</h2>

            <div class="form-group">
                <label for="name">Full Name<span style="color:#f97316;">*</span>:</label>
                <input type="text" id="name" name="name" required autocomplete="name" />
            </div>

            <div class="form-group">
                <label for="username">Username<span style="color:#f97316;">*</span>:</label>
                <input type="text" id="username" name="username" required autocomplete="username" />
            </div>

            <div class="form-group">
                <label for="password">Password<span style="color:#f97316;">*</span>:</label>
                <input type="password" id="password" name="password" required autocomplete="new-password" />
            </div>

            <div class="form-group">
                <label for="phone">Phone Number<span style="color:#f97316;">*</span>:</label>
                <input type="tel" id="phone" name="phone" required autocomplete="tel" pattern="[+0-9\s\-]+" title="Please enter a valid phone number" />
            </div>

            <div class="form-group">
                <label for="email">Email Address<span style="color:#f97316;">*</span>:</label>
                <input type="email" id="email" name="email" required autocomplete="email" />
            </div>

            <div class="form-group">
                <label for="address">Home Address<span style="color:#f97316;">*</span>:</label>
                <input type="text" id="address" name="address" required autocomplete="street-address" />
            </div>

            <div class="form-group">
                <label for="membership">Membership:</label>
                <select id="membership" name="membership">
                    <option value="">-- Select Option --</option>
                    <option value="Yes">Yes, I want to join membership</option>
                    <option value="No">No, I don’t want to join</option>
                </select>
            </div>

            <button type="submit" class="submit-btn">Register</button>
        </form>

    </body>
</html>
