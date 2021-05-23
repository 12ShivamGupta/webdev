<%@page import="com.dao.ReportedIncidentsByExpertsDAO"%>
<%@page import="com.dto.Customer"%>
<%@page import="com.dao.QuestionDAO"%>
<%@page import="com.dto.Question"%>
<%@page import="com.dto.Expert"%>
<%@page import="com.dto.ReportedIncidentsByExperts"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%
 
    ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");

    String expertid = (String) session.getAttribute("userid");
        
    int questionid = Integer.parseInt(request.getParameter("questionid"));
    
    String incDesc = request.getParameter("incDesc");
    
    Expert exp = new Expert();
    exp.setId(expertid);
    
    Question quest = new Question();
    quest.setId(questionid);
    
    QuestionDAO qdao = (QuestionDAO)context.getBean("questdao");
    
    Customer cust = qdao.getCustomerByQuestionID(questionid);
    
    ReportedIncidentsByExperts obj = new ReportedIncidentsByExperts();
    obj.setCustomerID(cust);
    obj.setIncDesc(incDesc);
    obj.setQuestionID(quest);
    obj.setExpertID(exp);
    
    ReportedIncidentsByExpertsDAO edao = (ReportedIncidentsByExpertsDAO)context.getBean("repexpdao");
    
    boolean b = edao.addIncidentByExpert(obj);
    
    if(b)
    out.print("success");
    else
    out.print("error");
%>