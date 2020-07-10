package com.whpu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.whpu.bean.Employee;
import com.whpu.bean.Result;
import com.whpu.services.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
public class EmpController {
    @Autowired
    EmpService empService;
    @GetMapping("/emp")
    public Result getEmps(@RequestParam(value = "pageNow",defaultValue = "1")Integer pageNow){
        PageHelper.startPage(pageNow,6);
        List<Employee> all = empService.getAll();
        PageInfo<Employee> employeePageInfo = new PageInfo<>(all,5);
        return new Result(200,true,employeePageInfo);
    }
    @PostMapping("/emp")
    public Result saveEmp(@Valid Employee employee, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            HashMap<Object, Object> objectObjectHashMap = new HashMap<>();
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                System.out.println("错误的字段："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                objectObjectHashMap.put(fieldError.getField(),fieldError.getDefaultMessage());

            }
            return new Result(200,false,objectObjectHashMap);
        }else{
            int i = empService.savaEmp(employee);
            if(i!=0){
                return new Result(100,true,"插入成功");
            }
        }
        return null;
    }
    @RequestMapping("/checkEmpName")
    public Result checkEmpName(@RequestParam("empName") String empName){
        boolean b = empService.CheckEmpName(empName);
        if(b){
            return  new Result(200,true,"用户名可用");
        }else {
            return new Result(100, false, "用户名不可用");
        }
    }
    @GetMapping("/emp/{id}")
    public Result getEmp(@PathVariable("id") Integer id){
        Employee employee=empService.getEmp(id);
        return new Result(100,true,employee);
    }
    @PutMapping("/emp/{empId}")
    public Result updateEmp(Employee employee){
        empService.updateEmp(employee);
        return new Result(100,true,"更新成功");
    }
    //单一批量二合一
    @DeleteMapping("/emp/{ids}")
    public Result DeleteEmpById(@PathVariable("empIdList") String ids){
        if(ids.contains(",")){
            ArrayList<Integer> integers = new ArrayList<>();
            String[] idList = ids.split(",");
            for (String s : idList) {
                integers.add(Integer.parseInt(s));
            }
            empService.delBatch(integers);
            return new Result(100,true,"批量删除成功");
        }else{
            empService.deleteEmpById(Integer.parseInt(ids));
            return new Result(100,true,"单个删除成功");
        }

    }
   /* @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pageNow",defaultValue = "1")Integer pageNow
    ,Model model ){
        PageHelper.startPage(pageNow,6);
        List<Employee> all = empService.getAll();
        PageInfo<Employee> employeePageInfo = new PageInfo<>(all,5);
        model.addAttribute("pageInfo",employeePageInfo);
        return "list";
    }*/
}
