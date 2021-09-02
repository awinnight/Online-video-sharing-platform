<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020-10-19
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme()
            + "://"
            + request.getServerName()
            + ":"
            + request.getServerPort()
            + request.getContextPath()
            + "/";
%>
<!--JSTL标签库-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--写base 标签，永远固定相对路径跳转的结果-->
<base href="<%=basePath%>">