<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Weblink</title>
<style>
    body {
        /* Background image with full cover and centered */
        background-image: url('${pageContext.request.contextPath}/images/movie-background1.jpeg');
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

    input[type="text"]{
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
        var title = document.forms["addweblinkform"]["title"].value.trim();
        var url = document.forms["addweblinkform"]["url"].value.trim();

        if (title === "" || url === "") {
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
	<form name="addweblinkform" method="POST" action="<%=request.getContextPath()%>/addWeblink" onsubmit="return validateForm()">
      <fieldset>
	 <u style="color:#DB5227"><b><legend style="font-family:garamond;font-size:34px;margin:0 0 0 10px;color:#DB5227;text-decoration: none;">New Weblink</legend>	    
	    </b></u><table>
			<tr>
			    <td><label style="font-family:garamond;font-size:30px;margin:0 0 0 10px;color:#DB5227;text-decoration: none;">Title:<span class="required">*</span></label></td>
			    <td>
			        <input type="text" name="title"><br>
			    </td>        
			</tr>
	    	<tr>
	    		<td><label style="font-family:garamond;font-size:30px;margin:0 0 0 10px;color:#DB5227;text-decoration: none;">URL:<span class="required">*</span></label></td>
        		<td>
        			<input type="text" name="url"><br>        			
        		</td>
        	</tr>
			<tr>&nbsp;</tr>
        	<tr>
        		<td>&nbsp;</td>
        		<td><input type="submit" name="submitWeblink" value="Add Weblink"></td>
				
        	</tr>
        </table>
	  </fieldset>      
    </form>
	</center>
	</div>
</body>
</html>