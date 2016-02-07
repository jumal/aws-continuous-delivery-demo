package org.jumaland;

import java.util.Date;

public class Grade {

    private String grade;
    private int score;
    private Date date;

    public String getGrade() {
        return grade;
    }

    public int getScore() {
        return score;
    }

    public Date getDate() {
        return date;
    }

    private Grade() {
        super();
    }

    public Grade(String grade, int score, Date date) {
        this();
        this.grade = grade;
        this.score = score;
        this.date = date;
    }
}
