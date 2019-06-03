package com.unicom.register.servlet;

import com.google.gson.Gson;
import com.unicom.entity.Blog;
import com.unicom.register.dao.ViewImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
/**
 * Servlet implementation class ViewServlet
 */
@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        //  String username=request.getParameter("username");
        ViewImpl view=new ViewImpl();
        List<Blog> list=new ArrayList<Blog>();
        list= view.query5();
        Gson gson = new Gson();
      String json = gson.toJson(list);  //将Pricels转化为Json数组

      //  Gson gson= new GsonBuilder().setPrettyPrinting().create();
     //   JsonParser jp = new JsonParserj();

      //  String prettyJsonString = gson.toJson(list);
       response.getWriter().print(json);
        out.flush();
        out.close();
	}

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
