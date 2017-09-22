package com.zr.service;

import java.util.List;

import com.zr.model.ProjectInfo;

/**
 * @Description
 * @author 郑少杰
 * @date 2017年9月20日 下午3:44:13
 * @version V1.3.1
 */

public interface ProjectInfomationService {
    /**
     * @Description 取到项目类型为categoryid的前top个项目
     * @author 郑少杰
     * @param categoryld 要取的项目类型
     * @param top 取前多少个
     * @return 项目信息列表
     */
    public List<ProjectInfo> getProjectInfomation(String categoryld, int top);

    /**
     * @Description 根据关键字查找项目数据
     * @author 郑少杰
     * @param key 关键字
     * @return 项目信息对象列表
     */
    public List<ProjectInfo> searchProjectInfoByKey(String key);

    /**
     * @Description 取得最近30天上线的项目
     * @author 郑少杰
     * @return 项目信息对象列表
     */
    public List<ProjectInfo> getAllProjectInfo(String categoryld);

    /**
     * @Description 根据项目类型和项目状态筛选在根据指定的排序范式进行排序
     * @author 郑少杰
     * @param categoryld 项目类型
     * @param state 状态
     * @param sort 排序方式
     * @return 项目列表
     */
    public List<ProjectInfo> getProjectInfoByCategoryld(String categoryld, String state,
            String sort);

}
