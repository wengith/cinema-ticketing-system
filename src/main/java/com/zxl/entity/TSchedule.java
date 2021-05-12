package com.zxl.entity;

import java.io.Serializable;
import java.util.List;

/**
 * (TSchedule)实体类
 *
 * @author makejava
 * @since 2020-10-05 10:25:40
 */
public class TSchedule implements Serializable {
    private static final long serialVersionUID = 749252848775505201L;

    private Integer scheduleid;

    private Integer movieobj;

    private Integer hallobj;

    private String scheduledate;

    private String scheduletime;

    private List<TMoviehall> moviehalls;

    private TMovie tMovie;

    /**
     * 选座规则 1-都可选 2-单排单号可选 3-单排双号可选  4-上座率30%
     */
    private Integer seatRule;

    public TMovie gettMovie() {
        return tMovie;
    }

    public void settMovie(TMovie tMovie) {
        this.tMovie = tMovie;
    }

    public List<TMoviehall> getMoviehalls() {
        return moviehalls;
    }

    public void setMoviehalls(List<TMoviehall> moviehalls) {
        this.moviehalls = moviehalls;
    }

    public Integer getScheduleid() {
        return scheduleid;
    }

    public void setScheduleid(Integer scheduleid) {
        this.scheduleid = scheduleid;
    }

    public Integer getMovieobj() {
        return movieobj;
    }

    public void setMovieobj(Integer movieobj) {
        this.movieobj = movieobj;
    }

    public Integer getHallobj() {
        return hallobj;
    }

    public void setHallobj(Integer hallobj) {
        this.hallobj = hallobj;
    }

    public String getScheduledate() {
        return scheduledate;
    }

    public void setScheduledate(String scheduledate) {
        this.scheduledate = scheduledate;
    }

    public String getScheduletime() {
        return scheduletime;
    }

    public void setScheduletime(String scheduletime) {
        this.scheduletime = scheduletime;
    }

    public Integer getSeatRule() {
        return seatRule;
    }

    public void setSeatRule(Integer seatRule) {
        this.seatRule = seatRule;
    }

    @Override
    public String toString() {
        return "TSchedule{" +
                "scheduleid=" + scheduleid +
                ", movieobj=" + movieobj +
                ", hallobj=" + hallobj +
                ", scheduledate='" + scheduledate + '\'' +
                ", scheduletime='" + scheduletime + '\'' +
                ", seatRule='" + seatRule + '\'' +
                ", moviehalls=" + moviehalls +
                '}';
    }
}