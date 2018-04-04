package com.jcohy.perfectteaching.repository;

import com.jcohy.perfectteaching.model.Test;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by jiac on 2018/4/2.
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :
 */
public interface TestRepository  extends JpaRepository<Test,Integer> {
}
