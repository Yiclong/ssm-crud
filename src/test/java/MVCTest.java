import com.github.pagehelper.PageInfo;
import com.whpu.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml",
        "file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MVCTest {
    @Autowired
    WebApplicationContext webApplicationContext;
    MockMvc mockMvc;
    @Before
    public  void initMockMVC(){
        mockMvc=MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }
    @Test
    public void testPage() throws Exception {
            MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps")
                .param("pageNow", "1")).andReturn();
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
        System.out.println("当前页："+pageInfo.getPageNum());
        System.out.println("总页："+pageInfo.getPages());
        System.out.println("总记录数："+pageInfo.getTotal());
        System.out.println("导航页：");
        int[] navigatePages = pageInfo.getNavigatepageNums();
        for (int navigatePage : navigatePages) {
            System.out.print(navigatePage+" ");
        }
        List<Employee> list = pageInfo.getList();
        for (Employee employee : list) {
            System.out.print(employee.getEmpId()+" ");
            System.out.println(employee.getEmpName());
        }
    }
}
