package pravlev.weblab2.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ControllerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strX = request.getParameter("x");
        String strY = request.getParameter("y");
        String strR = request.getParameter("r");
        if (isDataCorrect(strX) && isDataCorrect(strY) && isRCorrect(strR)) {
            request.getServletContext().getRequestDispatcher("/check").forward(request, response);
            return;
        }
        response.sendError(400, "Invalid coordinates");
    }

    private boolean isDataCorrect(String str) {
        if (str == null) {
            return false;
        }
        try {
            Double.parseDouble(str.replace(',', '.'));
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    private boolean isRCorrect(String strR) {
        if (!isDataCorrect(strR)) {
            return false;
        }
        return Double.parseDouble(strR.replace(',', '.')) > 0;
    }
}
