package com.nf.bookstore1.web;

import com.nf.bookstore1.dao.BookInMemoryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/del")
public class BookDel extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        BookInMemoryDAO dao = new BookInMemoryDAO();
        String msg = null;

        if(dao.delete(id)) {
            msg = "delete success.";
        } else {
            msg = "delete failure.";
        }
        //req.getRequestDispatcher("/index").forward(req, resp);
        resp.sendRedirect("/index?msg=" + msg);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] ids = req.getParameterValues("id");
        BookInMemoryDAO dao = new BookInMemoryDAO();
        // 组织成一次数据库操作，一切为了效率
        for (String id : ids) {
            dao.delete(Integer.parseInt(id));
        }
        // req.getRequestDispatcher("/index").forward(req,resp);
        resp.sendRedirect("/index");
    }
}
