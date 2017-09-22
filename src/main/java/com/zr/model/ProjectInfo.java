package com.zr.model;

import java.util.Date;

/**
 * @Description
 * @author 郑少杰
 * @date 2017年9月20日 下午3:29:56
 * @version V1.3.1
 */

public class ProjectInfo {
    private int id;
    private String name;
    private Date deadLine;
    private int raiseFund;
    private String describeld;
    private String image;
    private int hasRaised;
    private String state;

    /**
     * @return image
     */

    public String getImage() {
        return image;
    }


    /**
     * @param image 要设置的 image
     */

    public void setImage(String image) {
        this.image = image;
    }



    /**
     * @return id
     */

    public int getId() {
        return id;
    }

    /**
     * @param id 要设置的 id
     */

    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return name
     */

    public String getName() {
        return name;
    }

    /**
     * @param name 要设置的 name
     */

    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return deadLine
     */

    public Date getDeadLine() {
        return deadLine;
    }

    /**
     * @param deadLine 要设置的 deadLine
     */

    public void setDeadLine(Date deadLine) {
        this.deadLine = deadLine;
    }

    /**
     * @return raiseFund
     */

    public int getRaiseFund() {
        return raiseFund;
    }

    /**
     * @param raiseFund 要设置的 raiseFund
     */

    public void setRaiseFund(int raiseFund) {
        this.raiseFund = raiseFund;
    }

    /**
     * @return describeld
     */

    public String getDescribeld() {
        return describeld;
    }

    /**
     * @param describeld 要设置的 describeld
     */

    public void setDescribeld(String describeld) {
        this.describeld = describeld;
    }



    /**
     * @return hasRaised
     */

    public int getHasRaised() {
        return hasRaised;
    }

    /**
     * @param hasRaised 要设置的 hasRaised
     */

    public void setHasRaised(int hasRaised) {
        this.hasRaised = hasRaised;
    }

    /**
     * @return state
     */

    public String getState() {
        return state;
    }

    /**
     * @param state 要设置的 state
     */

    public void setState(String state) {
        this.state = state;
    }



}
