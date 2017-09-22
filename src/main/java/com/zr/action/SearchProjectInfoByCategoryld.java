package com.zr.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zr.model.ProjectInfo;
import com.zr.service.ProjectInfomationService;
import com.zr.service.impl.ProjectInfomationServiceImpl;

/**
 * Servlet implementation class SearchProjectInfoByCategoryld
 */
public class SearchProjectInfoByCategoryld extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ProjectInfomationService projectInfomationService = new ProjectInfomationServiceImpl();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchProjectInfoByCategoryld() {
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
        Map<String, String> map = new HashMap<>();
        request.setCharacterEncoding("utf8");
        map.put(null, "默认");
        map.put("start", "最新上线");
        map.put("hasRaised", "筹资额");
        map.put("raiseFund", "目标金额");

        String catrgroy = request.getParameter("c");
        String state = request.getParameter("s");
        String pString = request.getParameter("p");

        List<ProjectInfo> list =
                projectInfomationService.getProjectInfoByCategoryld(catrgroy, state, pString);
        if (catrgroy == null) {
            request.setAttribute("c", "全部");
        } else {
            request.setAttribute("c", catrgroy);
        }
        if (state == null) {
            request.setAttribute("s", "全部");
        } else {
            request.setAttribute("s", state);
        }
        request.setAttribute("p", map.get(pString));
        request.setAttribute("list", list);
        request.setAttribute("ca", true);
        request.getRequestDispatcher("search.jsp").forward(request, response);


    }

}
