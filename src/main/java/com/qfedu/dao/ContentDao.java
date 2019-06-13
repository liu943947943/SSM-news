package com.qfedu.dao;

import com.qfedu.pojo.Contents;
import com.qfedu.pojo.News;

import java.util.List;

/**
 * Created by Administrator on 2019/6/12.
 */
public interface ContentDao {
    List<Contents> selectContent(Integer id);
    void insertContent(Contents contents);
    void deleteById(Integer id);
}
