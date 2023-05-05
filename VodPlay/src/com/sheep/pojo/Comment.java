package com.sheep.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Comment {
    private Long id;

    private Long movieId;

    private String content;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")  
    private Date commentDate;

    private Long creator;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getMovieId() {
        return movieId;
    }

    public void setMovieId(Long movieId) {
        this.movieId = movieId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public Long getCreator() {
        return creator;
    }

    public void setCreator(Long creator) {
        this.creator = creator;
    }
}