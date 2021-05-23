<%@page import="com.dto.Expert"%>
<%@page import="com.dto.Question"%>
<%@page import="com.dto.Customer"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.dao.ReportedIncidentsByCustomerDAO"%>
<%@page import="com.dao.QuestionDAO"%>
<%@page import="com.dto.ReportedIncidentsByCustomer"%>
<%

ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");

String customerid = (String) session.getAttribute("userid");
        
    int questionid = Integer.parseInt(request.getParameter("questionid"));
    
    System.out.println("QuestionId :" + questionid);
    
    String incDesc = request.getParameter("incDesc");
    
    Customer cust = new Customer();
    cust.setId(customerid);
    
    Question quest = new Question();
    quest.setId(questionid);
    
    QuestionDAO qdao = (QuestionDAO)context.getBean("questdao");
    
    Expert exp = qdao.getExpertByQuestionID(questionid);
    		
    ReportedIncidentsByCustomer obj = new ReportedIncidentsByCustomer();
    obj.setCustomerID(cust);
    obj.setIncDesc(incDesc);
    obj.setQuestionID(quest);
    obj.setExpertID(exp);
    
    ReportedIncidentsByCustomerDAO cdao =  (ReportedIncidentsByCustomerDAO)context.getBean("repcustdao");
    
    boolean b = cdao.addIncidentByCustomer(obj);
    
    if(b)
    out.print("success");
    else
    out.print("error");
%>