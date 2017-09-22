package com.zr.dao;

import java.util.List;

import com.zr.model.ProjectInfo;

/**
 * @Description
 * @author 郑少杰
 * @date 2017年9月20日 下午3:57:56
 * @version V1.3.1
 */

public interface ProjectInfomationDao {
    /**
     * @Description 查询项目类型为categoryid的前top个项目
     * @author 郑少杰
     * @param categoryld 要查询的项目类型
     * @param top 查询前多少项
     * @return 项目信息列表
     */
    public List<ProjectInfo> selectProjectInfomation(String categoryld, int top);

    /**
     * @Description 根据关键字查找项目数据
     * @author 郑少杰
     * @param key 关键字
     * @return 项目信息对象列表
     */
    public List<ProjectInfo> selectProjectInfoByKey(String key);

    /**
     * @Description 取得该类别最近30天上线的项目
     * @param categoryld 类别
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
    public List<ProjectInfo> selectProjectInfoByCategoryld(String categoryld, String state,
            String sort);
}
