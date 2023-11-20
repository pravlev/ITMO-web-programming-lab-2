package pravlev.weblab2.servlets;

import pravlev.weblab2.table.HitResult;
import pravlev.weblab2.table.ResultTable;
import pravlev.weblab2.table.TableRow;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;

public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        final long startTime = System.nanoTime();

        double x = Double.parseDouble(request.getParameter("x").replace(',', '.'));
        double y = Double.parseDouble(request.getParameter("y").replace(',', '.'));
        double r = Double.parseDouble(request.getParameter("r").replace(',', '.'));

        OffsetDateTime currentTimeObject = OffsetDateTime.now(ZoneOffset.UTC);
        String currentTime;
        if (request.getParameter("timezone") != null && !request.getParameter("timezone").equals("")) {
            currentTimeObject = currentTimeObject.minusMinutes(Long.parseLong(request.getParameter("timezone")));
        }
        currentTime = currentTimeObject.format(DateTimeFormatter.ofPattern("HH:mm:ss"));

        boolean hit = check(x, y, r);
        final long endTime = System.nanoTime();

        TableRow tableRow = new TableRow(x, y, r, hit ? HitResult.HIT : HitResult.MISS, currentTime, endTime - startTime);
        ResultTable results = (ResultTable) request.getServletContext().getAttribute("table");
        if (results == null) {
            results = new ResultTable();
        }
        results.addRow(tableRow);
        request.getServletContext().setAttribute("table", results);

        response.sendRedirect(request.getContextPath() + "/results.jsp");
    }

    private boolean check(double x, double y, double r) {
        if (x <= 0 && y >= 0) {
            return x >= -r && y <= -r / 2;
        }
        if (x <= 0 && y <= 0) {
            return x * x + y * y <= r * r;
        }
        if (x >= 0 && y <= 0) {
            return y >= x - r;
        }
        return false;
    }
}
