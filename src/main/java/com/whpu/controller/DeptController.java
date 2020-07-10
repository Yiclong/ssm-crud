package com.whpu.controller;

import com.whpu.bean.Department;
import com.whpu.bean.Result;
import com.whpu.services.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DeptController {

    @Autowired
    private DeptService deptService;
    @RequestMapping("/depts")
    @ResponseBody
    public Result getDepts(){
        List<Department> departments = deptService.getDepts();
        return new Result(200,true,departments);
    }
}
