package com.zr.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.zr.model.ProjectInfo;
import com.zr.service.ProjectInfomationService;
import com.zr.service.impl.ProjectInfomationServiceImpl;

/**
 * @Description
 * @author 郑少杰
 * @date 2017年9月20日 下午4:59:43
 * @version V1.3.1
 */

public class ShowProjectInfomation extends HttpServlet {
    ProjectInfomationService project = new ProjectInfomationServiceImpl();

    /**
     * Description
     * 
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest,
     *      javax.servlet.http.HttpServletResponse)
     */

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }

    /**
     * Description
     * 
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest,
     *      javax.servlet.http.HttpServletResponse)
     */

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("utf8");
        resp.setCharacterEncoding("utf8");
        String category = req.getParameter("category");

        int top = Integer.parseInt(req.getParameter("top"));

        List<ProjectInfo> list = project.getProjectInfomation(category, top);
        PrintWriter printWriter = resp.getWriter();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("num", list.size());
        jsonObject.put("list", list);

        printWriter.write(jsonObject.toString());



    }

}
