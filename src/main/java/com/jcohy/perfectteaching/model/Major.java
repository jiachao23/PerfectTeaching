package com.jcohy.perfectteaching.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :专业表
 */
@Entity
@Table(name = "major")
public class Major implements Serializable{
    private static final long serialVersionUID = 5L;
    //Id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    //专业编号
    @Column(name = "major_num")
    private Integer num;
    //专业名
    @Column(name = "major_name")
    private String name;
    //专业办公室电话
    @Column(name = "major_tel")
    private String tel;
    //辅导员
    @Column(name = "major_assistant")
    private String assistant;
    //所属院系

    @ManyToOne
    @JoinColumn(name = "dept_id")
    private Dept dept;

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

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAssistant() {
        return assistant;
    }

    public void setAssistant(String assistant) {
        this.assistant = assistant;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }
}
