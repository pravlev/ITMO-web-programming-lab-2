<%@ page import="pravlev.weblab2.table.ResultTable" %>
<%@ page import="pravlev.weblab2.table.TableRow" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>results</title>
  <link href="css/style.css" rel="stylesheet">
  <link href="css/results_style.css" rel="stylesheet">
  <link rel="icon" href="img/favicon.png">
</head>
<body>
<div class="header">
  <h1>results</h1>
</div>
<div class="container">
  <div class="results-holder">
    <table class="results">
      <thead>
      <tr>
        <th>x value</th>
        <th>y value</th>
        <th>r value</th>
        <th>result</th>
        <th>current time</th>
        <th>execution time (ns)</th>
      </tr>
      </thead>
      <tbody id="body">
      <%ResultTable resultTable = (ResultTable) request.getServletContext().getAttribute("table");
        for (TableRow row : resultTable.getResults()) {%>
          <tr>
          <td><%=row.getX()%></td>
          <td><%=row.getY()%></td>
          <td><%=row.getR()%></td>
          <td><%=row.getHitResult()%></td>
          <td><%=row.getCurrentTime()%></td>
          <td><%=row.getExecutionTime()%></td>
        </tr>
        <%}
      %>
      </tbody>
    </table>
  </div>
  <div class="button-holder">
    <a href="<%=request.getContextPath()%>/index.jsp">
      <button id="back-button">back</button>
    </a>
  </div>
</div>
</body>
</html>
