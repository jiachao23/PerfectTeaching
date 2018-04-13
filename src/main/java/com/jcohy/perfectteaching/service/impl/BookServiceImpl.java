package com.jcohy.perfectteaching.service.impl;

import com.jcohy.perfectteaching.model.Book;
import com.jcohy.perfectteaching.repository.BookRepository;
import com.jcohy.perfectteaching.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by jiac on 2018/4/9.
 * ClassName  : com.jcohy.scis.service.impl
 * Description  :
 */
@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookRepository bookRepository;

    @Override
    public Book saveOrUpdate(Book book) {
        return bookRepository.save(book);
    }
}
