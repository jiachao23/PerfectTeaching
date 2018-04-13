package com.jcohy.perfectteaching.service.impl;

import com.jcohy.perfectteaching.model.Course;
import com.jcohy.perfectteaching.repository.CourseRepository;
import com.jcohy.perfectteaching.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jiac on 2018/4/13.
 * ClassName  : com.jcohy.perfectteaching.service.impl
 * Description  :
 */
@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseRepository courseRepository;
    @Override
    public List<Course> findAll() {
        return courseRepository.findAll();
    }

    @Override
    public Page<Course> findAll(Pageable Pageable) {
        return courseRepository.findAll(Pageable);
    }

    @Override
    public Course findById(Integer id) {
        return courseRepository.findById(id).get();
    }

    @Override
    public Course saveOrUpdate(Course course) {
        return courseRepository.save(course);
    }

    @Override
    public Course findByNum(Integer num) {
        return courseRepository.findLabByNum(num);
    }

    @Override
    public void delete(Integer id) {
        courseRepository.deleteById(id);
    }

    @Override
    public Course change(Integer id, String type) {
        Course course =findById(id);
        switch (type){
            case "status":
                course.setStatus(course.getStatus() == 0 ? 1:0);
                break;
            default:
                break;
        }
        return courseRepository.save(course);
    }
}
