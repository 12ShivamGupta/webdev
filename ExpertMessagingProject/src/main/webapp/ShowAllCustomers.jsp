<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.dao.CustomerDAO"%>
<%@page import="com.dto.Customer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
<title>Expert Messaging</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 </head>
    <body>
             <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2> Registered <b>Customer List</b></h2>
                    </div>
                </div>
            </div>
            <br>
            <table id="table_my" class="table-info table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>FirstName</th>
                        <th>LastName</th>
                        <th>MobileNo</th>
                       <th>Blocked </th>
                        <th>Change</th>
                     </tr>
                </thead>
                <tbody>
                    <% try {
                    	
                    	ApplicationContext context = 
new ClassPathXmlApplicationContext("spring.xml");
                    	
                            CustomerDAO dao = (CustomerDAO)
context.getBean("custdao");
                            
                            List<Customer> lst = dao.getAllCustomers();

                            for (Customer s : lst) {

                    %>

                    <tr>

                        <td><%=s.getId()%></td>

                        <td><%=s.getFirstName()%></td>
                        <td><%=s.getLastName()%></td>
                        <td><%=s.getMobileNumber()%></td>
                        <td><%=s.isBlocked()%></td>
                        
                        <td><%  if (!s.isBlocked()){%>
                            <a href="blockcustomer?custid=<%=s.getId()%>" class="delete"  data-toggle="modal"><img title="BLOCK" style="height: 30px; width: 30px;"  src="<c:url value="/resources/images/33.png"/>"></a>
                          <%} else  {%>
                            <a href="unblockcustomer?custid=<%=s.getId()%>" class="delete"  data-toggle="modal"><img title="BLOCK" style="height: 30px; width: 30px;"  src="<c:url value="/resources/images/22.png"/>"></a>
                        <%}%>                        
                        </td>
                    </tr>

                <%
                        }
                    } catch (Exception e) {

                    }
                %>
             </tbody>
    </table>
   </body>
</html>
