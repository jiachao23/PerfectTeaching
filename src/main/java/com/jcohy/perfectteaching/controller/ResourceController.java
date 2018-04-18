package com.jcohy.perfectteaching.controller;

import com.jcohy.perfectteaching.common.JsonResult;
import com.jcohy.perfectteaching.common.PageJson;
import com.jcohy.perfectteaching.model.Book;
import com.jcohy.perfectteaching.model.Lab;
import com.jcohy.perfectteaching.service.BookService;
import com.jcohy.perfectteaching.service.LabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by jiac on 2018/4/17.
 * ClassName  : com.jcohy.perfectteaching.controller
 * Description  :
 */
@Controller
@RequestMapping("/teacher/resource")
public class ResourceController extends BaseController{


    @Autowired
    private BookService bookService;

    @Autowired
    private LabService labService;



    @GetMapping("/list")
    @ResponseBody
    public PageJson<Book> all(ModelMap map){
        PageRequest pageRequest = getPageRequest();
        Page<Book> books = bookService.findAll(pageRequest);
        PageJson<Book> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(books.getContent().size());
        page.setData(books.getContent());
        return page;
    }

    @GetMapping("/form")
    public String form(@RequestParam(required = false) Integer id, ModelMap map){
        List<Book> books = bookService.findAll();
        map.put("books",books);
        if(id != null){
            Book book = bookService.findById(id);
            map.put("book",book);
        }
        return "teacher/resource/form";
    }

    @PostMapping("/save")
    @ResponseBody
    public JsonResult save(Book book,Integer num){
        try {
            Book dbbook = null;
            Lab lab = labService.findByNum(num);
            if(lab == null){
                return JsonResult.fail("此课程/实验不存在");
            }
            if(book.getId() != null){
                dbbook = bookService.findById(book.getId());
                if(book.getDownloadUrl() != null ) dbbook.setDownloadUrl(book.getDownloadUrl());
                if(book.getStatus() != null ) dbbook.setStatus(book.getStatus() );
                if(book.getName()  != null ) dbbook.setName(book.getName() );
                dbbook.setLab(lab);
            }else{
                dbbook = book;
                dbbook.setLab(lab);
            }
            bookService.saveOrUpdate(dbbook);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok();
    }

    @DeleteMapping("/{id}/del")
    @ResponseBody
    public JsonResult del(@PathVariable("id") Integer id){
        try {
            bookService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail("删除失败");
        }
        return JsonResult.ok();
    }
}
