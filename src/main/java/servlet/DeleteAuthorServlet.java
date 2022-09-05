package servlet;

import manager.AuthorManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(urlPatterns = "/author/delete")
public class DeleteAuthorServlet extends HttpServlet {

    private AuthorManager authorManager = new AuthorManager();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int authorId = Integer.parseInt(request.getParameter("authorId"));
        authorManager.deleteAuthor(authorId);
        response.sendRedirect("/authors");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
