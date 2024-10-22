<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
    body {
        /* Background image with full cover and centered */
        background-image: url('${pageContext.request.contextPath}/images/bookmark.jpeg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        position: relative;
        font-family: Arial, sans-serif;
        color: white;
    }

    /* Overlay to fade the image */
    body::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: rgba(0, 0, 0, 0.5); /* Black overlay with 50% opacity */
        z-index: 1;
    }

    /* Ensures that content is above the overlay */
    .content {
        position: relative;
        z-index: 2;
    }

    /* Styling for the header and form content */
    .header {
        height: 65px;
        background: #DB5227;
        color: white;
        padding-top: 20px;
		padding-left: 10px;
    }

    .header a {
        font-family: Garamond;
        font-size: 34px;
        color: white;
        text-decoration: none;
    }

    fieldset {
        border: none;
        padding: 20px;
        margin: 30px;
        background-color: rgba(255, 255, 255, 0.8); /* Light background for form */
		color: #333;
		width: 40%
    }

    table {
        width: 100%;
    }

    input[type="text"], input[type="password"] {
        width: 70%;
        padding: 8px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    input[type="submit"] {
        background-color: #DB5227;
        color: white;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #B13100;
    }
</style>
<script>
    var buttonClicked = "";

    // Set which button is clicked
    function setButton(action) {
        buttonClicked = action;
    }

    function validateForm() {
        var email = document.forms["loginForm"]["email"].value.trim();
        var password = document.forms["loginForm"]["password"].value.trim();

        // Only validate when login is clicked
        if (buttonClicked === "logIn") {
            if (email === "" || password === "") {
                alert("Email and Password Required");
                return false; // Prevent form submission if login form is incomplete
            }
        }
        return true; // Allow form submission
    }
</script>
</head>
<body>
	<div class="content">
		       <div class="header">
		           <b><a href="#">thrill.io</a></b>
		       </div>
		       <br><br>
			   <center>
	<br><br>
	<form name="loginForm" method="POST" action="<%=request.getContextPath()%>/login" onsubmit="return validateForm()">
      <fieldset>
		<u style="color:#DB5227"><b><legend style="font-family:garamond;font-size:34px;margin:0 0 0 10px;color:#DB5227;text-decoration: none;">Login</legend>	    
			    </b></u><br><br>   
	    <table>
	    	<tr>
	    		<td><label style="font-family:garamond;font-size:30px;margin:0 0 0 10px;color:#DB5227;text-decoration: none;">Email:</label></td>
        		<td>
        			<input type="text" name="email"><br>        			
        		</td>
        	</tr>
        	<tr>
        		<td><label style="font-family:garamond;font-size:30px;margin:0 0 0 10px;color:#DB5227;text-decoration: none;">Password:</label></td>
        		<td>
        			<input type="password" name="password"><br>
        		</td>        
        	</tr>
        	<tr>
        		<td>&nbsp;</td>
        		<td><input type="submit" name="submit" value="logIn" onclick="setButton('logIn')">&nbsp;<input type="submit" name="submit" value="signUp" onclick="setButton('signUp')"></td>
				
        	</tr>
        </table>
	  </fieldset>      
    </form>
</body>
</html>