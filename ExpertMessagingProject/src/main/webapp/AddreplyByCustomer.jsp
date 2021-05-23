<%@page import="com.dto.Expert"%>
<%@page import="com.dao.QuestionDAO"%>
<%@page import="com.dto.Question"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>


<%
    ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");

    int questionid = Integer.parseInt(request.getParameter("questionid"));
    
    String incDesc = request.getParameter("incDesc");
    
    String userid = (String)session.getAttribute("userid");
   
    QuestionDAO qdao = (QuestionDAO)context.getBean("questdao");
    
    Expert ex = qdao.getExpertByQuestionID(questionid);
    
    boolean b = qdao.addReply(questionid, incDesc,userid,ex.getId());
    
    if(b)
    out.print("success");
    else
    out.print("error");
%>