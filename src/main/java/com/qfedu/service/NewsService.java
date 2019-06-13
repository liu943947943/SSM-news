package com.qfedu.service;

import com.qfedu.pojo.News;

import java.util.List;
import java.util.Map;

/**
 * Created by HP on 2019/6/12.
 */
public interface NewsService {
     List<News> findAllnews(String keyword);
     void addNews(News news);
     void deleteNewsById(Integer id);
     News findNewsById(Integer id);

}
