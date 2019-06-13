package com.qfedu.controller;/**
 * Created by HP on 2019/6/12.
 */

import com.qfedu.pojo.News;
import com.qfedu.service.NewsService;
import com.qfedu.vo.JsonBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * @author HP liuchenglong
 * @create 2019-06-12 9:57
 **/

@RestController// @Controller + @ResponseBody
@RequestMapping("/news")
public class NewsController {

    @Autowired
    private NewsService newsService;

    @RequestMapping("/list.do")
    public JsonBean list(String keyword){
        List<News> list = newsService.findAllnews(keyword);
        System.out.println(list);
        return new JsonBean(1, list);
    }
    @RequestMapping("/add.do")
    public JsonBean addNews(News news){
        newsService.addNews(news);
        return new JsonBean(1, null);
    }
    @RequestMapping("/delete.do")
    public JsonBean delNews(Integer id){
        newsService.deleteNewsById(id);
        return new JsonBean(1, null);
    }
    @RequestMapping("/query.do")
    public JsonBean findNewsById(Integer id){
        News news=newsService.findNewsById(id);

        return new JsonBean(1,news);
    }

}