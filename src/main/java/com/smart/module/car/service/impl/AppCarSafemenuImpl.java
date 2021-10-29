package com.smart.module.car.service.impl;

import com.smart.common.constant.SystemConstant;
import com.smart.common.dynamicquery.DynamicQuery;
import com.smart.common.model.PageBean;
import com.smart.common.model.Result;
import com.smart.common.util.DateUtils;
import com.smart.common.util.ShiroUtils;
import com.smart.module.car.entity.AppCarSafemenu;
import com.smart.module.car.entity.CarParkManage;
import com.smart.module.car.repository.AppCarSafemenuRepository;
import com.smart.module.car.service.AppCarSafemenuService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class AppCarSafemenuImpl implements AppCarSafemenuService {

    @Resource
    private DynamicQuery dynamicQuery;
    @Resource
    private AppCarSafemenuRepository appCarSafemenuRepository;

//    @Override
//    public long countByExample(AppCarSafemenuExample example){return appCarSafemenuRepository.countByExample(example);}
//
//    @Override
//    public int deleteByExample(AppCarSafemenuExample example){return appCarSafemenuRepository.deleteByExample(example);}
//
//    @Override
//    public int deleteByPrimaryKey(Long id){return appCarSafemenuRepository.deleteByPrimaryKey(id);}
//
//    @Override
//    public int insert(AppCarSafemenu record){return appCarSafemenuRepository.insert(record);}
//
//    @Override
//    public int insertSelective(AppCarSafemenu record){return appCarSafemenuRepository.insertSelective(record);}
//
//    @Override
//    public List<AppCarSafemenu> selectByExample(AppCarSafemenuExample example){return appCarSafemenuRepository.selectByExample(example);}
//
//    @Override
//    public AppCarSafemenu selectByPrimaryKey(Long id){return appCarSafemenuRepository.selectByPrimaryKey(id);}
//
//    @Override
//    public int updateByExampleSelective(@Param("record") AppCarSafemenu record, @Param("example") AppCarSafemenuExample example)
//    {return appCarSafemenuRepository.updateByExampleSelective(record, example);}
//
//    @Override
//    public int updateByExample(@Param("record") AppCarSafemenu record, @Param("example") AppCarSafemenuExample example)
//    {return appCarSafemenuRepository.updateByExample(record, example);}
//
//    @Override
//    public int updateByPrimaryKeySelective(AppCarSafemenu record)
//    {return appCarSafemenuRepository.updateByPrimaryKeySelective(record);}
//
//    @Override
//    public int updateByPrimaryKey(AppCarSafemenu record){return appCarSafemenuRepository.updateByPrimaryKey(record);}

    @Override
    public Result save(AppCarSafemenu entity) {
        if(entity.getId()==null){
//            entity.setGmtCreate(DateUtils.getTimestamp());
//            entity.setGmtModified(entity.getGmtCreate());
            System.out.println("保存失败");
        }else{
//            entity.setGmtModified(DateUtils.getTimestamp());
        }
        appCarSafemenuRepository.saveAndFlush(entity);
        return Result.ok("保存成功");
    }

    @Override
    public Result list(AppCarSafemenu entity) {
        String nativeSql = "SELECT COUNT(*) FROM app_car_safemenu";
        nativeSql += common(entity);
        Long count = dynamicQuery.nativeQueryCount(nativeSql);
        PageBean<CarParkManage> data = new PageBean<>();
        if(count>0){
            nativeSql = "SELECT * FROM app_car_safemenu ";
            nativeSql += common(entity);
//            nativeSql += "ORDER BY gmt_create desc";
            Pageable pageable = PageRequest.of(entity.getPageNo(),entity.getPageSize());
            List<AppCarSafemenu> list =  dynamicQuery.nativeQueryPagingList(AppCarSafemenu.class,pageable,nativeSql);
            data = new PageBean(list,count);
        }
        return Result.ok(data);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Map<String,Object>> select(AppCarSafemenu entity) {
        String nativeSql = "SELECT id,name,text FROM app_car_safemenu WHERE 1=1";
        if(ShiroUtils.isHasRole(SystemConstant.ROLE_ADMIN)){
            if(entity.getId()!=null){
                nativeSql +=" AND id="+entity.getId();
            }
        }else{
//            Long orgId = ShiroUtils.getUserEntity().getOrgId();
//            nativeSql +=" AND id="+Id;
            System.out.println("error");
        }
        return dynamicQuery.nativeQueryListMap(nativeSql);
    }

    public String common(AppCarSafemenu entity){
        String description = entity.getDescription();
        String commonSql = "";
        if(StringUtils.isNotBlank(description)){
            commonSql += "WHERE name like '"+description+"%' ";
        }
        return commonSql;
    }

}
