package com.semanticsquare.thrillio.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.semanticsquare.thrillio.entities.Books;
import com.semanticsquare.thrillio.entities.Movies;
import com.semanticsquare.thrillio.entities.Users;
import com.semanticsquare.thrillio.entities.WebLinks;
import com.semanticsquare.thrillio.service.BookmarkingService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class BookmarkController {

    @Autowired
    BookmarkingService service;
    
    // Remove the static Users user as we will store it in the session
    
    @RequestMapping("/")
    public String home(Model model) {
        return "home";
    }
    
    @PostMapping("/login")
    public String getDashboard(HttpServletRequest request, HttpSession session, Model model) {
        String choice = request.getParameter("submit");
        
        if (choice.equals("logIn")) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Users user = service.userLogin(email, password);
            
            if (user == null) {
                return "InvalidLogin";
            }

            // Store user in session
            session.setAttribute("user", user);
            
           model= updateDashboardData(model,user);
            return "dashboard";
        } else {
            return "signIn";
        }
    }
    
    @PostMapping("/addUser")
    public String newUser(HttpServletRequest request) {
        service.addUser(request.getParameter("fName"), request.getParameter("lName"), request.getParameter("date_of_birth"),
                        request.getParameter("email"), request.getParameter("password"));
        return "home";
    }
    
    @RequestMapping("/forwardToAddBook")
	public void forwardToAddBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/pages/addbook.jsp");
        dispatcher.forward(request, response);
	}
    
    @PostMapping("/addBook")
    public String addBook(HttpServletRequest request, HttpSession session, Model model) {
        // Retrieve the user from session
        Users user = (Users) session.getAttribute("user");
        
        // Make sure the user is logged in
        if (user == null) {
            return "redirect:/"; // Redirect to home if no user found in session
        }
        
        service.addBook(user.getId(), request.getParameter("title"), request.getParameter("genre"), request.getParameter("url"));
        model=updateDashboardData(model, user);
        
        return "redirect:/dashboard";
    }
    
    @RequestMapping("/forwardToAddMovie")
	public void forwardToAddMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/pages/addmovie.jsp");
        dispatcher.forward(request, response);
	}

    @PostMapping("/addMovie")
    public String addMovie(HttpServletRequest request, HttpSession session, Model model) {
        Users user = (Users) session.getAttribute("user");
        
        if (user == null) {
            return "redirect:/";
        }
        
        service.addMovie(user.getId(), request.getParameter("title"), request.getParameter("genre"), request.getParameter("url"));
        model=updateDashboardData(model, user);
        
        return "redirect:/dashboard";
    }
    
    @RequestMapping("/forwardToAddWeblink")
	public void forwardToAddWeblink(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/pages/addweblink.jsp");
        dispatcher.forward(request, response);
	}

    @PostMapping("/addWeblink")
    public String addWeblink(HttpServletRequest request, HttpSession session, Model model) {
        Users user = (Users) session.getAttribute("user");
        
        if (user == null) {
            return "redirect:/";
        }
        
        service.addWeblink(user.getId(), request.getParameter("title"), request.getParameter("url"));
        model=updateDashboardData(model, user);
        
        return "redirect:/dashboard";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Invalidate the session on logout
        return "home";
    }

    // Helper method to update dashboard data (books, movies, weblinks)
    private Model updateDashboardData(Model model, Users user) {
        List<Books> books = service.getAllBooks(user.getId());
        List<Movies> movies = service.getAllMovies(user.getId());
        List<WebLinks> weblinks = service.getAllWebLinks(user.getId());

        model.addAttribute("books", books);
        model.addAttribute("movies", movies);
        model.addAttribute("weblinks", weblinks);
        
        return model;
    }
    
    @RequestMapping("/dashboard")
    public String dashboardViewer(Model model, HttpSession session)
    {
    	Users user = (Users) session.getAttribute("user");
    	model=updateDashboardData(model,user);
    	return "dashboard";
    }
}
