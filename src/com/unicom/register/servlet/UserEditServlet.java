package com.unicom.register.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.unicom.register.dao.UserEditImpl ;
import com.unicom.entity.User;



/**
 * Servlet implementation class UserEditServlet
 */
@WebServlet("/UserEditServlet")
public class UserEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	    request.setCharacterEncoding("utf-8");
	    response.setCharacterEncoding("utf-8");
	     String username=request.getParameter("user");
	     String password=request.getParameter("pwd");
	     String nickname=request.getParameter("nickname");
	     User user=new User();
	
	     user.setUsername(username);
	     user.setPassword(password);
	     user.setNickname(nickname);
	     //System.out.println(username);
	    UserEditImpl resEditImpl=new UserEditImpl();
	    if (resEditImpl.edit(user)) {
	    	System.out.println("�޸ĳɹ�");
			
		}
	    else {
			System.out.println("ʧ��");
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
