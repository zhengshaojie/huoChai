package com.zr.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zr.model.ProjectInfo;
import com.zr.service.ProjectInfomationService;
import com.zr.service.impl.ProjectInfomationServiceImpl;

/**
 * Servlet implementation class SearchProjectInfoByKey
 */
public class SearchProjectInfoByKey extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ProjectInfomationService projectInfomationService = new ProjectInfomationServiceImpl();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchProjectInfoByKey() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");
        String key = request.getParameter("key");
        List<ProjectInfo> list = projectInfomationService.searchProjectInfoByKey(key);
        if (list.size() != 0) {

            request.setAttribute("list", list);
        } else {

            list = projectInfomationService.searchProjectInfoByKey(null);
            request.setAttribute("list", list);
            request.setAttribute("msg", true);
        }
        request.setAttribute("key", key);
        request.getRequestDispatcher("search.jsp").forward(request, response);



    }

}
