package com.qfedu.service.impl;/**
 * Created by HP on 2019/6/12.
 */

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qfedu.dao.NewsDao;
import com.qfedu.pojo.News;
import com.qfedu.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author HP liuchenglong
 * @create 2019-06-12 9:55
 **/
@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    private NewsDao newsDao;


    @Override
    public List<News> findAllnews(String keyword) {
        return newsDao.findAll(keyword);
    }

    @Override
    public void addNews(News news) {
          news.setCreateTime(new Date());
         newsDao.add(news);
    }

    @Override
    public void deleteNewsById(Integer id) {
        newsDao.deleteById(id);
    }

    @Override
    public News findNewsById(Integer id) {
        return newsDao.findNewsById(id);
    }


}