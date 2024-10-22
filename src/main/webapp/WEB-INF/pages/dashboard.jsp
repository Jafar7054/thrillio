<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>thrill.io</title>
<style>
    body {
        /* Background image with full cover and centered */
       /* background-image: url('${pageContext.request.contextPath}/images/bookmark.jpeg');*/
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        position: relative;
        font-family: Arial, sans-serif;
        color: white;
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

	/* Specific backgrounds for each section */
	   #books-section {
	       background-image: url('${pageContext.request.contextPath}/images/book-background.jpeg');
	       background-size: cover;
	       background-position: center;
	   }

	   #movies-section {
	       background-image: url('${pageContext.request.contextPath}/images/movie-background1.jpeg');
	       background-size: cover;
	       background-position: center;
	   }

	   #weblinks-section {
	       background-image: url('${pageContext.request.contextPath}/images/weblinks.jpeg');
	       background-size: cover;
	       background-position: center;
	   }

	   /* General section content styles */
	   fieldset {
	       border: none;
	       padding: 20px;
	       background-color: rgba(255, 255, 255, 0.8); /* Light background for form */
		color: #333;
		width: 90%;
	   }
</style>
</head>
<body>
    <div class="header">
        <!-- Thrillio Logo -->
        <b>thrill.io</b>

        <!-- Browse and Logout Links -->
        <div style="float: right; margin-right: 20px;">
            <b>
				<a href="<%=request.getContextPath()%>/forwardToAddBook" style="font-size: 16px; color: white; text-decoration: none; margin-right: 15px;">New Book</a>
				<a href="<%=request.getContextPath()%>/forwardToAddMovie" style="font-size: 16px; color: white; text-decoration: none; margin-right: 15px;">New Movie</a>
				<a href="<%=request.getContextPath()%>/forwardToAddWeblink" style="font-size: 16px; color: white; text-decoration: none; margin-right: 15px;">New Weblink</a>
                <a href="<%=request.getContextPath()%>/forwardToBrowse" style="font-size: 16px; color: white; text-decoration: none; margin-right: 15px;">Browse</a>
                <a href="<%=request.getContextPath()%>/logout" style="font-size: 16px; color: white; text-decoration: none;">Logout</a>
            </b>
        </div>
    </div>
    <br><br>
    
	<!-- Books Section -->
	<div id="books-section" class="section">
	    <div class="section-content">
	        <h2>Books</h2>
	        <fieldset>
	            <c:choose>
	                <c:when test="${!empty(books)}">
	                    <table>
	                        <c:forEach var="book" items="${books}" varStatus="status">
	                            <c:if test="${status.index % 4 == 0}">
	                                <tr>
	                            </c:if>
	                            <td style="padding: 20px; text-align: center;">
	                                <img src="${pageContext.request.contextPath}/images/books.jpeg" alt="Description" width="175" height="200"><br><br>
	                                <a href="${book.url}" style="font-size:16px;color: #B13100;margin-left:10px;text-decoration:none;">
	                                    ${book.title}
	                                </a><br>
	                                &nbsp; Book Genre: <span style="color: #B13100;">${book.book_genre}</span>
	                            </td>
	                            <c:if test="${status.index % 4 == 3 || status.last}">
	                                </tr>
	                            </c:if>
	                        </c:forEach>
	                    </table>
	                </c:when>
	                <c:otherwise>
	                    <br><br>
	                    <span style="font-size: 24px;color: #DB5227;margin:400px;">You haven't saved any items yet!</span>
	                </c:otherwise>
	            </c:choose>
	        </fieldset>
	    </div>
	</div>

        <!-- Movies Section -->
		<div id="movies-section" class="section">
		        <div class="section-content">
		            <h2>Movies</h2>
        <c:choose>
            <c:when test="${!empty(movies)}">
              <fieldset>  <table>
                    <c:forEach var="movie" items="${movies}" varStatus="status">
						<c:if test="${status.index % 4 == 0}">
                        <tr>
							</c:if>
                            <td style="padding: 20px; text-align: center;">
                                <img src="${pageContext.request.contextPath}/images/movie-background1.jpeg" alt="Description" width="175" height="200"><br><br>
								<a href="${movie.url}" style="font-size:16px;color: #B13100;margin-left:10px;text-decoration:none;">${movie.title}</a><br>
								&nbsp; Movie Genre: <span style="color: #B13100;">${movie.movie_genre}</span>
							</td>
							<c:if test="${status.index % 4 == 3 || status.last}">
							    </tr>
							</c:if>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <br><br>
                <span style="font-size: 24px;color: #DB5227;margin:400px;">You haven't saved any items yet!</span>
            </c:otherwise>
        </c:choose></fieldset>
		</div></div>
        <!-- WebLinks Section -->
		<div id="weblinks-section" class="section">
		       <div class="section-content">
		           <h2>WebLinks</h2>
        <c:choose>
            <c:when test="${!empty(weblinks)}">
               <fieldset> <table>
                    <c:forEach var="weblink" items="${weblinks}" varStatus="status">
						<c:if test="${status.index % 4 == 0}">
                        <tr>
							</c:if>
                            <td style="padding: 20px; text-align: center;">
                                <img src="${pageContext.request.contextPath}/images/weblinks.jpeg" alt="Description" width="175" height="200"><br><br>
								<a href="${weblink.url}" style="font-size:16px;color: #B13100;margin-left:10px;text-decoration:none;">${weblink.title}</a>
								<br>
							</td>
							<c:if test="${status.index % 4 == 3 || status.last}">
								</tr>
							</c:if>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <br><br>
                <span style="font-size: 24px;color: #DB5227;margin:400px;">You haven't saved any items yet!</span>
            </c:otherwise>
        </c:choose></fieldset></div></div>
    </div>
</body>
</html>
