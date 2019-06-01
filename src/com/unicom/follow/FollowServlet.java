package com.unicom.follow;


import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.unicom.entity.Blog;

/**
 * 
 * @author Administrator
 *
 */
@WebServlet("/qryFollow")
public class FollowServlet extends HttpServlet{
	FollowService followService = new FollowService();
	private static final long serialVersionUID = 1L;
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp){
		doGet(req, resp);
		
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp){
		resp.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
        resp.setCharacterEncoding("UTF-8");
        List<Blog>  list = followService.qryFollow((String)request.getSession().getAttribute("username"));
        try {
			resp.getWriter().print(JSON.toJSONString(list,SerializerFeature.WriteMapNullValue));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
