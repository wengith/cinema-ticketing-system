package com.zxl.vo;

/**
 * @Author: wen
 * @Date: 2021/5/11 1:01
 * @Description: 票房信息
 * @Version: 1.0
 */
public class BoxOfficeVo {
    /**
     * 电影名
     */
    private String movieName;
    /**
     * 票房量
     */
    private Integer count;

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
