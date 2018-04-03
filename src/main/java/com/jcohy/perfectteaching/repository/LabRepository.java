package com.jcohy.perfectteaching.repository;

import com.jcohy.perfectteaching.model.Lab;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by jiac on 2018/4/2.
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :
 */
public interface LabRepository  extends JpaRepository<Lab,Integer> {

    Lab findLabByNum(Integer num);

}
