<%@ page import="java.sql.*, javax.servlet.http.*, util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // --- Get username from session ---
    HttpSession sessionObj = request.getSession(false);
    String username = null;
    if (sessionObj != null) {
        username = (String) sessionObj.getAttribute("username");
    }
    if (username == null) {
        response.sendRedirect("customer_login.jsp");
        return;
    }

    // --- Variables for user data ---
    String name = "", address = "", email = "", phone = "";
    String errorMessage = "", successMessage = "";

    try (Connection conn = DBConnection.createConnection()) {
        PreparedStatement ps = conn.prepareStatement(
            "SELECT fullname, address, email, phone FROM CUSTOMERS WHERE username = ?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("fullname");
            address = rs.getString("address");
            email = rs.getString("email");
            phone = rs.getString("phone");
        }
    } catch (Exception e) {
        errorMessage = "Database error: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <style>
        /* ... your existing styles ... */
    </style>
</head>
<body>

<form class="profile-container" action="CustUpdateProfile" method="post">
    <h2>User Profile</h2>

    <% if (!errorMessage.isEmpty()) { %>
        <p style="color: red;"><%= errorMessage %></p>
    <% } %>
    <% if (!successMessage.isEmpty()) { %>
        <p style="color: green;"><%= successMessage %></p>
    <% } %>

    <div class="info-group">
        <label>Full Name:</label>
        <input type="text" name="name" value="<%= name %>" required />
    </div>

    <div class="info-group">
        <label>Address:</label>
        <input type="text" name="address" value="<%= address %>" required />
    </div>

    <div class="info-group">
        <label>Email:</label>
        <input type="email" name="email" value="<%= email %>" required />
    </div>

    <div class="info-group">
        <label>Phone:</label>
        <input type="tel" name="phone" value="<%= phone %>" pattern="[0-9]{10,15}" required />
    </div>

    <div class="info-group">
        <label>New Password:</label>
        <input type="password" name="password" placeholder="Leave blank to keep current password" />
    </div>

    <!-- Pass username securely via hidden input -->
    <input type="hidden" name="username" value="<%= username %>" />

    <button type="submit" class="update-btn">Update Profile</button>
</form>

</body>
</html>
