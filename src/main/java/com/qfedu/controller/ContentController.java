package com.qfedu.controller;


import com.qfedu.pojo.Contents;
import com.qfedu.pojo.News;
import com.qfedu.service.ContentService;
import com.qfedu.vo.JsonBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Administrator on 2019/6/12.
 */

@Controller
@ResponseBody
public class ContentController {
    @Autowired
    private ContentService contentService;
    @RequestMapping("/content.do")
    public JsonBean selectContent(Integer id){
        List<Contents> list=contentService.selectContent(id);
        System.out.println(list);
        return new JsonBean(1,list);
    }
    @RequestMapping("/add.do")
    public JsonBean addNews(Contents contents,Integer id){
        contentService.insertContent(contents,id);
        return new JsonBean(1, null);
    }
    @RequestMapping("/delete.do")
    public JsonBean delNews(Integer id){
        contentService.deleteNewsById(id);
        return new JsonBean(1, null);
    }
}