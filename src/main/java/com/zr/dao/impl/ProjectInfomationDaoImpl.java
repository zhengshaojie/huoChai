package com.zr.dao.impl;

import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zr.dao.ProjectInfomationDao;
import com.zr.model.ProjectInfo;
import com.zr.util.JDBCUtil;

/**
 * @Description
 * @author 郑少杰
 * @date 2017年9月20日 下午4:00:09
 * @version V1.3.1
 */

public class ProjectInfomationDaoImpl implements ProjectInfomationDao {

    /**
     * Description 查询项目类型为categoryld前top个项目
     * 
     * @param categoryld 要查询的项目类型
     * @param top 查询前多少项
     * @return 查询到的项目列表
     * @see com.zr.dao.ProjectInfomationDao#getProjectInfomation(java.lang.String)
     */

    @Override
    public List<ProjectInfo> selectProjectInfomation(String categoryld, int top) {
        List<ProjectInfo> list = new ArrayList<>();
        StringBuffer sql = new StringBuffer();
        sql.append(
                "select project.id,image,projectinformation.name,deadline,raiseFund,hasRaised,state,projectdescribe.describe ");
        sql.append("from project,projectdescribe,projectinformation,projectimage,projectcategory ");
        sql.append("where project.projectInformationId = projectinformation.id ");
        sql.append(
                "and  projectinformation.imageId = projectimage.id and projectinformation.projectDescribeId = projectdescribe.id ");
        sql.append(
                "and projectinformation.projectDescribeId = projectdescribe.id and project.categoryId = projectcategory.id ");
        sql.append(
                "and  projectcategory.category like ? ORDER BY projectinformation.`start` ASC limit ?");
        Connection connection = JDBCUtil.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql.toString());
            if (categoryld == null) {
                preparedStatement.setString(1, "%%");
            } else {
                preparedStatement.setString(1, categoryld);
            }

            preparedStatement.setInt(2, top);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ProjectInfo projectInfo = new ProjectInfo();
                projectInfo.setId(resultSet.getInt("id"));
                projectInfo.setImage(resultSet.getString("image"));
                projectInfo.setName(resultSet.getString("name"));
                projectInfo.setDeadLine(resultSet.getDate("deadline"));
                projectInfo.setRaiseFund(resultSet.getInt("raiseFund"));
                projectInfo.setHasRaised(resultSet.getInt("hasRaised"));
                projectInfo.setState(resultSet.getString("state"));
                Clob clob = resultSet.getClob("describe");
                projectInfo.setDescribeld(clob.getSubString(1, (int) clob.length()));
                list.add(projectInfo);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            JDBCUtil.closeJDBC(preparedStatement, connection);
        }
        return list;
    }

    /**
     * Description 根据关键字查找匹配的项目信息
     * 
     * @param key 关键字
     * @return 项目信息对象列表
     * @see com.zr.dao.ProjectInfomationDao#selectProjectInfoByKey(java.lang.String)
     */

    @Override
    public List<ProjectInfo> selectProjectInfoByKey(String key) {
        List<ProjectInfo> list = new ArrayList<>();
        StringBuffer sql = new StringBuffer();
        sql.append(
                "select project.id,image,projectinformation.name,deadline,raiseFund,hasRaised,state,projectdescribe.describe ");
        sql.append("from project,projectdescribe,projectinformation,projectimage,projectcategory ");
        sql.append("where project.projectInformationId = projectinformation.id ");
        sql.append(
                "and  projectinformation.imageId = projectimage.id and projectinformation.projectDescribeId = projectdescribe.id ");
        sql.append(
                "and projectinformation.projectDescribeId = projectdescribe.id and project.categoryId = projectcategory.id ");
        sql.append("and projectinformation.name like ? ");
        Connection connection = JDBCUtil.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql.toString());
            if (key == null) {
                preparedStatement.setString(1, "%%");
            } else {
                preparedStatement.setString(1, "%" + key + "%");
            }


            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ProjectInfo projectInfo = new ProjectInfo();
                projectInfo.setId(resultSet.getInt("id"));
                projectInfo.setImage(resultSet.getString("image"));
                projectInfo.setName(resultSet.getString("name"));
                projectInfo.setDeadLine(resultSet.getDate("deadline"));
                projectInfo.setRaiseFund(resultSet.getInt("raiseFund"));
                projectInfo.setHasRaised(resultSet.getInt("hasRaised"));
                projectInfo.setState(resultSet.getString("state"));
                Clob clob = resultSet.getClob("describe");
                projectInfo.setDescribeld(clob.getSubString(1, (int) clob.length()));
                list.add(projectInfo);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            JDBCUtil.closeJDBC(preparedStatement, connection);
        }
        return list;
    }

    /**
     * Description 查询该类别最近30天上线的项目
     * 
     * @param categoryld 类别
     * @return 项目信息列表
     * @see com.zr.dao.ProjectInfomationDao#getAllProjectInfo()
     */

    @Override
    public List<ProjectInfo> getAllProjectInfo(String categoryld) {

        List<ProjectInfo> list = new ArrayList<>();
        StringBuffer sql = new StringBuffer();
        sql.append(
                "select project.id,image,projectinformation.name,deadline,raiseFund,hasRaised,state,projectdescribe.describe ");
        sql.append("from project,projectdescribe,projectinformation,projectimage,projectcategory ");
        sql.append("where project.projectInformationId = projectinformation.id ");
        sql.append(
                "and  projectinformation.imageId = projectimage.id and projectinformation.projectDescribeId = projectdescribe.id ");
        sql.append(
                "and projectinformation.projectDescribeId = projectdescribe.id and project.categoryId = projectcategory.id ");
        sql.append("and  projectcategory.category like ? ORDER BY projectinformation.`start` ASC");
        Connection connection = JDBCUtil.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql.toString());
            if (categoryld == null) {
                preparedStatement.setString(1, "%%");
            } else {
                preparedStatement.setString(1, categoryld);
            }
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ProjectInfo projectInfo = new ProjectInfo();
                projectInfo.setId(resultSet.getInt("id"));
                projectInfo.setImage(resultSet.getString("image"));
                projectInfo.setName(resultSet.getString("name"));
                projectInfo.setDeadLine(resultSet.getDate("deadline"));
                projectInfo.setRaiseFund(resultSet.getInt("raiseFund"));
                projectInfo.setHasRaised(resultSet.getInt("hasRaised"));
                projectInfo.setState(resultSet.getString("state"));
                Clob clob = resultSet.getClob("describe");
                projectInfo.setDescribeld(clob.getSubString(1, (int) clob.length()));
                list.add(projectInfo);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            JDBCUtil.closeJDBC(preparedStatement, connection);
        }
        return list;
    }

    /**
     * Description 查询该类别的所有信息
     * 
     * @param categoryld 类别
     * @return 该类的所有项目信息列表
     * @see com.zr.dao.ProjectInfomationDao#selectProjectInfoByCategoryld(java.lang.String)
     */

    @Override
    public List<ProjectInfo> selectProjectInfoByCategoryld(String categoryld, String state,
            String sort) {
        List<ProjectInfo> list = new ArrayList<>();
        StringBuffer sql = new StringBuffer();
        sql.append(
                "select project.id,image,projectinformation.name,deadline,raiseFund,hasRaised,state,projectdescribe.describe ");
        sql.append("from project,projectdescribe,projectinformation,projectimage,projectcategory ");
        sql.append("where project.projectInformationId = projectinformation.id ");
        sql.append(
                "and  projectinformation.imageId = projectimage.id and projectinformation.projectDescribeId = projectdescribe.id ");
        sql.append(
                "and projectinformation.projectDescribeId = projectdescribe.id and project.categoryId = projectcategory.id ");
        sql.append("and  projectcategory.category like ? and state like ? ");
        sql.append("ORDER BY " + sort + " ASC");
        Connection connection = JDBCUtil.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql.toString());

            if (categoryld == null) {

                preparedStatement.setString(1, "%%");
            } else {
                preparedStatement.setString(1, categoryld);
            }
            if (state == null) {
                preparedStatement.setString(2, "%%");
            } else {
                preparedStatement.setString(2, state);
            }
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ProjectInfo projectInfo = new ProjectInfo();
                projectInfo.setId(resultSet.getInt("id"));
                projectInfo.setImage(resultSet.getString("image"));
                projectInfo.setName(resultSet.getString("name"));
                projectInfo.setDeadLine(resultSet.getDate("deadline"));
                projectInfo.setRaiseFund(resultSet.getInt("raiseFund"));
                projectInfo.setHasRaised(resultSet.getInt("hasRaised"));
                projectInfo.setState(resultSet.getString("state"));
                Clob clob = resultSet.getClob("describe");
                projectInfo.setDescribeld(clob.getSubString(1, (int) clob.length()));
                list.add(projectInfo);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            JDBCUtil.closeJDBC(preparedStatement, connection);
        }
        return list;
    }

}
