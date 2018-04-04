package com.jcohy.perfectteaching.model;

import java.io.Serializable;

/**
 * Created by jiac on 2018/4/4.
 * ClassName  : com.jcohy.perfectteaching.model
 * Description  :
 */

public class Answer implements Serializable{
    private int index;
    private String answer;

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Answer{");
        sb.append("index=").append(index);
        sb.append(", answer='").append(answer).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
