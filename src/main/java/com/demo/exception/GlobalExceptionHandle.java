package com.demo.exception;

import com.demo.pojo.RespBean;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

/**
 * 全局异常处理器
 */
@RestControllerAdvice
public class GlobalExceptionHandle {

    @ExceptionHandler(SQLException.class)
    public RespBean mySqlException(SQLException e)
    {
      e.printStackTrace();
      if(e instanceof SQLIntegrityConstraintViolationException)
      {
          return RespBean.error("该数据有关联数据,删除失败");
      }
        return RespBean.error("数据库异常，删除失败");
    }

    @ExceptionHandler(UsernameNotFoundException.class)
    public RespBean mySqlException(UsernameNotFoundException e)
    {
        e.printStackTrace();

        return RespBean.error("用户名或密码错误");
    }

}
