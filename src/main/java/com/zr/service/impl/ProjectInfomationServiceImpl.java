package com.zr.service.impl;

import java.util.List;

import com.zr.dao.ProjectInfomationDao;
import com.zr.dao.impl.ProjectInfomationDaoImpl;
import com.zr.model.ProjectInfo;
import com.zr.service.ProjectInfomationService;

/**
 * @Description
 * @author 郑少杰
 * @date 2017年9月20日 下午3:58:49
 * @version V1.3.1
 */
public class ProjectInfomationServiceImpl implements ProjectInfomationService {

    ProjectInfomationDao project = new ProjectInfomationDaoImpl();

    /**
     * Description 取得项目类型为categoryid的所有项目
     * 
     * @param categoryld 要取的项目类型
     * @param top 取前多少个
     * @return 该类型的所有项目
     * @see com.zr.service.ProjectInfomationService#getProjectInfomation(java.lang.String)
     */

    @Override
    public List<ProjectInfo> getProjectInfomation(String categoryld, int top) {
        List<ProjectInfo> list = project.selectProjectInfomation(categoryld, top);
        return list;
    }

    /**
     * Description 根据关键字查找匹配的项目信息
     * 
     * @param key 关键字
     * @return 匹配的项目信息的列表
     * @see com.zr.service.ProjectInfomationService#searchProjectInfoByKey(java.lang.String)
     */

    @Override
    public List<ProjectInfo> searchProjectInfoByKey(String key) {
        List<ProjectInfo> list = project.selectProjectInfoByKey(key);
        return list;
    }

    /**
     * Description 取得最近30天上线的数据
     * 
     * @return 匹配的项目信息列表
     * @see com.zr.service.ProjectInfomationService#getAllProjectInfo()
     */

    @Override
    public List<ProjectInfo> getAllProjectInfo(String categoryld) {
        List<ProjectInfo> list = project.getAllProjectInfo(categoryld);
        return list;
    }

    /**
     * Description
     * 
     * @param categoryld
     * @param state
     * @param sort
     * @return
     * @see com.zr.service.ProjectInfomationService#getProjectInfoByCategoryld(java.lang.String,
     *      java.lang.String, java.lang.String)
     */

    @Override
    public List<ProjectInfo> getProjectInfoByCategoryld(String categoryld, String state,
            String sort) {
        List<ProjectInfo> list = project.selectProjectInfoByCategoryld(categoryld, state, sort);
        return list;
    }



}
