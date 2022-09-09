package servlet;

import manager.AuthorManager;
import manager.BookManager;
import model.Author;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize =  1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 100
)
@WebServlet(urlPatterns = "/author/add")
public class AddAuthorServlet extends HttpServlet {
    private AuthorManager authorManager = new AuthorManager();

    private static final String imagePath = "C:\\Users\\Admin\\IdeaProjects\\libraryimages\\";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         User user = (User) request.getSession().getAttribute("user");
        if(user == null){
            response.sendRedirect("/");
        }else {
            request.getRequestDispatcher("/WEB-INF/addAuthor.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        int age = Integer.parseInt(request.getParameter("age"));
        Part authorPic = request.getPart("authorPic");
        String fileName = null;
        if(authorPic != null){
            long nanoTime = System.nanoTime();

            fileName = nanoTime + "_" + authorPic.getSubmittedFileName();
            authorPic.write(imagePath + fileName);
        }

        Author author = Author.builder()
                .name(name)
                .surname(surname)
                .email(email)
                .age(age)
                .authorPic(fileName)
                .build();
        authorManager.addAuthor(author);

        response.sendRedirect("/authors");
    }
}
