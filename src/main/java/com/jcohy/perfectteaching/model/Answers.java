package com.jcohy.perfectteaching.model;

import java.util.List;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 18:33 2018/4/4
 * Email: jia_chao23@126.com
 * ClassName: Answers
 * Description:
 **/
public class Answers {

    Integer studentId;

    Integer labId;

    List<Answer> answers;

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getLabId() {
        return labId;
    }

    public void setLabId(Integer labId) {
        this.labId = labId;
    }

    public List<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<Answer> answers) {
        this.answers = answers;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Answers{");
        sb.append("studentId=").append(studentId);
        sb.append(", labId=").append(labId);
        sb.append(", answers=").append(answers);
        sb.append('}');
        return sb.toString();
    }
}
