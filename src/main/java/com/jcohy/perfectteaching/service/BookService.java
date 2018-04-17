package com.jcohy.perfectteaching.service;


import com.jcohy.perfectteaching.model.Book;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Created by jiac on 2018/4/9.
 * ClassName  : com.jcohy.scis.service
 * Description  :
 */
public interface BookService {

    Book saveOrUpdate(Book book);

    /**
     *
     * 根据id删除
     * @param id
     */
    void delete(Integer id);

    /**
     * 通过Id查找
     * @param id
     * @return
     */
    Book findById(Integer id);

    /**
     * 查询所有实验
     * @return
     */
    List<Book> findAll();

    /**
     * 分页查询
     * @param Pageable
     * @return
     */
    Page<Book> findAll(Pageable Pageable);
}
