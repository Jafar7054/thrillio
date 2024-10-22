<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
<style>
    body {
        /* Background image with full cover and centered */
        background-image: url('${pageContext.request.contextPath}/images/bookshelf2.jpeg');
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
	
	.required {
	       color: red;
	       margin-left: 5px;
	   }
</style>
<script>
    function validateForm() {
        var firstName = document.forms["signupForm"]["fName"].value.trim();
        var lastName = document.forms["signupForm"]["lName"].value.trim();
        var dob = document.forms["signupForm"]["date_of_birth"].value.trim();
        var email = document.forms["signupForm"]["email"].value.trim();
        var password = document.forms["signupForm"]["password"].value.trim();

        if (firstName === "" || lastName === "" || dob === "" || email === "" || password === "") {
            alert("Fill all required fields");
            return false; // Prevents form submission
        }
        return true; // Allows form submission
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
	<form name="signupForm" method="POST" action="<%=request.getContextPath()%>/addUser" onsubmit="return validateForm()">
      <fieldset>
	 <u style="color:#DB5227"><b><legend style="font-family:garamond;font-size:34px;margin:0 0 0 10px;color:#DB5227;text-decoration: none;">Sign Up</legend>	    
	    </b></u><table>
			<tr>
			    <td><label style="font-family:garamond;font-size:30px;margin:0 0 0 10px;color:#DB5227;text-decoration: none;">First Name:<span class="required">*</span></label></td>
			    <td>
			        <input type="text" name="fName"><br>
			    </td>        
			</tr>
			<tr>
			    <td><label style="font-family:garamond;font-size:30px;margin:0 0 0 10px;color:#DB5227;text-decoration: none;">Last Name:<span class="required">*</span></label></td>
			    <td>
			        <input type="text" name="lName"><br>
			    </td>        
			</tr>
			<tr>
				<td>
				       <label style="font-family: Garamond; font-size: 30px; margin: 0 0 0 10px; color: #DB5227; text-decoration: none;">
				           DOB:<span class="required">*</span>
				       </label>
				   </td>
				   <td>
				       <div style="position: relative;">
				           <input type="date" name="date_of_birth" id="dob-input" style="font-family: Garamond; font-size: 24px; padding: 10px; border-radius: 4px; border: 1px solid #ccc; width: 250px;">

				       </div>
				      
				   </td>      
			</tr>
	    	<tr>
	    		<td><label style="font-family:garamond;font-size:30px;margin:0 0 0 10px;color:#DB5227;text-decoration: none;">Email:<span class="required">*</span></label></td>
        		<td>
        			<input type="text" name="email"><br>        			
        		</td>
        	</tr>
        	<tr>
        		<td><label style="font-family:garamond;font-size:30px;margin:0 0 0 10px;color:#DB5227;text-decoration: none;">Password:<span class="required">*</span></label></td>
        		<td>
        			<input type="password" name="password"><br>
        		</td>        
        	</tr>
			<tr>&nbsp;</tr>
        	<tr>
        		<td>&nbsp;</td>
        		<td><input type="submit" name="submitUser" value="Sign Up"></td>
				
        	</tr>
        </table>
	  </fieldset>      
    </form>
	</center>
	</div>
</body>
</html>