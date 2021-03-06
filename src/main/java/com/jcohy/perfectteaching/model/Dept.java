package com.jcohy.perfectteaching.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :院系表
 */
@Entity
@Table(name = "dept")
public class Dept implements Serializable{

    private static final long serialVersionUID = 10L;
    //Id
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    //院系编号
    @Column(name = "dept_num")
    private Integer num;
    //名字
    @Column(name = "dept_name")
    private String name;
    //院系主任
    @Column(name = "dept_chairman")
    private String chairman;
    //电话
    @Column(name = "dept_tel")
    private String tel;
    //简介
    @Column(name = "dept_desc")
    private String desc;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getChairman() {
        return chairman;
    }

    public void setChairman(String chairman) {
        this.chairman = chairman;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
