<%@ page import="pravlev.weblab2.table.ResultTable" %>
<%@ page import="pravlev.weblab2.table.TableRow" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>web lab №2</title>
    <link href="css/style.css" rel="stylesheet">
    <link href="css/form_style.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="header">
        <h1>student: shcherbinin lev</h1>
        <h2>group: p3231</h2>
        <h2>var: 9937362</h2>
    </div>
    <div class="graph">
        <canvas id="graphic" width="420px" height="420px"></canvas>
    </div>
    <div class="form">
        <form action="controller" method="post" id="coordinates">
            <div class="x-select">
                <label for="x">select x</label><br>
                <select id="x" class="select" name="x">
                    <option value="-2">-2</option>
                    <option value="-1.5">-1.5</option>
                    <option value="-1">-1</option>
                    <option value="-0.5">-0.5</option>
                    <option value="0">0</option>
                    <option value="0.5">0.5</option>
                    <option value="1">1</option>
                    <option value="1.5">1.5</option>
                    <option value="2">2</option>
                </select>
            </div>
            <div class="y-text">
                <label for="y" id="y-label">enter y</label><br>
                <input id="y" maxlength="12" placeholder="-3...5" type="text" name="y"/>
            </div>
            <div class="r-buttons">
                <label for="r" id="r-label">select r</label><br>
                <input type="hidden" id="r" value="1" name="r">
                <input class="inputR" type="Button" size="10"  value="1" disabled="true" onclick="saveR(this)">
                <input class="inputR" type="Button" size="10"  value="2" onclick="saveR(this)">
                <input class="inputR" type="Button" size="10"  value="3" onclick="saveR(this)">
                <input class="inputR" type="Button" size="10"  value="4" onclick="saveR(this)">
                <input class="inputR" type="Button" size="10"  value="5" onclick="saveR(this)">
            </div>
            <input id="hidden-timezone" type="hidden" name="timezone" value="">
            <div class="button-wrap" id="submit-wrap">
                <button type="submit" id="submit-button">check</button>
            </div>
        </form>
    </div>
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

            <%
                if (request.getServletContext().getAttribute("table") == null) {
                    request.getServletContext().setAttribute("table", new ResultTable());
                }
                ResultTable resultTable = (ResultTable) request.getServletContext().getAttribute("table");
                for (TableRow row : resultTable.getResults()) {
            %>
            <tr>
                <td><%=row.getX()%></td>
                <td><%=row.getY()%></td>
                <td><%=row.getR()%></td>
                <td><%=row.getHitResult()%></td>
                <td><%=row.getCurrentTime()%></td>
                <td><%=row.getExecutionTime()%></td>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
<script src="//cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="js/validator.js"></script>
<script src="js/graph.js"></script>
<script src="js/saveR.js"></script>
<script>
    $(document).ready(function () {
        drawDots(1);
        $('#r').on('change', function () {
            drawGraph(document.getElementById('r').value);
            drawDots(document.getElementById('r').value);
        });
    });

    function drawDots(r) {
        <%resultTable = (ResultTable) request.getServletContext().getAttribute("table");
        for (TableRow row : resultTable.getResults()) {%>
        drawDot(210 + <%=row.getX()%> / <%=row.getR()%> * r * 40, 210 - <%=row.getY()%> / <%=row.getR()%> * r * 40, '#ccffcc');
        <%}%>
    }
</script>
</body>
</html>