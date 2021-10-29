package com.smart.module.car.web;

import com.smart.common.model.Result;
import com.smart.module.car.entity.AppCarSafemenu;
import com.smart.module.car.entity.CarParkManage;
import com.smart.module.car.repository.AppCarSafemenuRepository;
import com.smart.module.car.service.AppCarSafemenuService;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/car/safemenu")
public class AppCarSafemenuController {
    //注入service
    //方法一：通过autowired
    @Autowired
    private AppCarSafemenuService appCarSafemenuService;
    @Autowired
    private AppCarSafemenuRepository appCarSafemenuRepository;
//    //方法二：通过构造器注入service
//    public UserLoginController(UserLoginService userLoginService){
//        this.userLoginService=userLoginService;
//    }

//    @GetMapping("/mylist")
//    public String mylist(){ return "/car/safemenu/list";}
//
//
//
//    @GetMapping("/safemenu")
//    @ResponseBody
//    public List<AppCarSafemenu> SelectAppCarSafemenu(){
//        //构造查询条件
//        //创建查询条件类
//        AppCarSafemenuExample example=new AppCarSafemenuExample();
//        //创建条件构造器
//        AppCarSafemenuExample.Criteria criteria=example.createCriteria();
//        //通过criteria设置条件
//        //criteria.andUserTypeEqualTo("1");
//        //criteria.andCurrentStatusEqualTo("0");
//
//
//        //2根据条件查询
//        List<AppCarSafemenu> list=appCarSafemenuService.selectByExample(example);
//        return list;
//    }

    /**
     * 列表
     */
    @PostMapping("list")
    @RequiresRoles(value={"admin","orgAdmin"},logical = Logical.OR)
    public Result list(AppCarSafemenu entity){
        return appCarSafemenuService.list(entity);
    }

    /**
     * 获取
     */
    @PostMapping("get")
    @RequiresRoles(value={"admin","orgAdmin"},logical = Logical.OR)
    public Result get(Long id){
        AppCarSafemenu appCarSafemenu =
                appCarSafemenuRepository.findById(id).orElse(new AppCarSafemenu());
        return Result.ok(appCarSafemenu);
    }

    /**
     * 保存
     */
    @PostMapping("save")
    @RequiresRoles(value={"admin","orgAdmin"},logical = Logical.OR)
    public Result save(@RequestBody AppCarSafemenu entity){
        return appCarSafemenuService.save(entity);
    }

    /**
     * 删除
     */
    @PostMapping("delete")
    @RequiresRoles(value={"admin","orgAdmin"},logical = Logical.OR)
    public Result delete(Long id){
        appCarSafemenuRepository.deleteById(id);
        return Result.ok();
    }

    /**
     * 列表
     */
    @PostMapping("/select")
    @RequiresRoles(value={"admin","orgAdmin"},logical = Logical.OR)
    public Result select(AppCarSafemenu entity){
        List<Map<String,Object>> list = appCarSafemenuService.select(entity);
        return Result.ok(list);
    }
}
