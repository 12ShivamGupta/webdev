<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/resources/js/sweetalert2.all.js"/>" type='text/javascript'></script>
<script src="<c:url value="/resources/js/jquery.min.js"/>" type="text/javascript"></script>

<%
out.println("<script>");
out.println("$(document).ready(function(){");
out.println("swal ( 'Message From Server' ,  'Question Sub Category is Successfully Deleted !!!' ,"
        + "  'warning' );");
out.println("});");
out.println("</script>");
%>
<jsp:include page="questionsubcategory.jsp"></jsp:include>