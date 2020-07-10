package com.whpu.services;

import com.whpu.bean.Employee;
import com.whpu.bean.EmployeeExample;
import com.whpu.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EmpService {
    @Autowired
    EmployeeMapper employeeMapper;
    //查询所有
    public List<Employee> getAll() {
        List<Employee> employees = employeeMapper.selectByExampleWithDept(null);
        return employees;
    }
    public int savaEmp(Employee employee){
        int i = employeeMapper.insertSelective(employee);
        return 1;
    }

    public boolean CheckEmpName(String empName) {
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count=employeeMapper.countByExample(example);
        return  count==0;
    }

    public Employee getEmp(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return  employee;
    }
    public void updateEmp(Employee employee) {
       employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteEmpById(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void delBatch(List<Integer> idList) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpIdIn(idList);
        employeeMapper.deleteByExample(employeeExample);
    }
}
