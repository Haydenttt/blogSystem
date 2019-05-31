package com.unicom.register.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.unicom.register.dao.UserRegister ;

/**
 * Servlet implementation class UserRegister
 */
@WebServlet("/UserRegister")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
	  String username=request.getParameter("username");
	  String password=request.getParameter("password");	  
	  String gender1=request.getParameter("gender");
	  boolean gender=true;
	  if (gender1.equals("0")) {
		  gender=false;
	}
	  System.out.println(gender1);
	  String email=request.getParameter("email");
	  String nickname=request.getParameter("nickname");
	 System.out.println(username);
	 System.out.println(password);
	 System.out.println(gender);
	 System.out.println(nickname);
	 System.out.println(email);
	  UserRegister userRegister=new UserRegister();
	
		  boolean boolean1=userRegister.insert(username, password,gender, nickname, email);
		  if (boolean1) {
			System.out.println("成功");
			request.getRequestDispatcher("success.jsp").forward(request, response); 
			}else {
				response.sendRedirect("error.jsp");
				
			}
		

	  
	  
	  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
