package com.qfedu.dao;/**
 * Created by HP on 2019/6/12.
 */

import com.qfedu.pojo.News;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author HP liuchenglong
 * @create 2019-06-12 9:49
 **/

public interface NewsDao {
   List<News> findAll(String keyword);
   void add(News news);
   void deleteById(Integer id);

   News findNewsById(Integer id);



}