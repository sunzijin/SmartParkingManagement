package com.smart.module.car.service;

import com.smart.common.model.Result;
import com.smart.module.car.entity.AppCarSafemenu;

import java.util.List;
import java.util.Map;

public interface AppCarSafemenuService {
//    long countByExample(AppCarSafemenuExample example);
//
//    int deleteByExample(AppCarSafemenuExample example);
//
//    int deleteByPrimaryKey(Long id);
//
//    int insert(AppCarSafemenu record);
//
//    int insertSelective(AppCarSafemenu record);
//
//    List<AppCarSafemenu> selectByExample(AppCarSafemenuExample example);
//
//    AppCarSafemenu selectByPrimaryKey(Long id);
//
//    int updateByExampleSelective(@Param("record") AppCarSafemenu record, @Param("example") AppCarSafemenuExample example);
//
//    int updateByExample(@Param("record") AppCarSafemenu record, @Param("example") AppCarSafemenuExample example);
//
//    int updateByPrimaryKeySelective(AppCarSafemenu record);
//
//    int updateByPrimaryKey(AppCarSafemenu record);
    /**
     * 保存
     * @param entity
     * @return
     */
    Result save(AppCarSafemenu entity);

    /**
     * 列表
     * @param entity
     * @return
     */
    Result list(AppCarSafemenu entity);

    /**
     * 列表
     * @param entity
     * @return
     */
    List<Map<String,Object>> select(AppCarSafemenu entity);
}

