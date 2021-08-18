/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yukii
 */
@WebServlet(name = "MathServlet", urlPatterns = {"/math.html"})
public class MathServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Calculadora</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Calculadora</h1>");
            try{
                double n1 = Double.parseDouble(request.getParameter("n1"));
                double n2 = Double.parseDouble(request.getParameter("n2"));
                out.println("<form action='math.html'>");
                out.println("<input type=\"number\" step=\"0.1\" name=\"n1\" value=\"1.0\"/>");
                out.println("<input type=\"number\" step=\"0.1\" name=\"n2\" value=\"1.0\"/>");
                out.println("<input type=\"submit\" value=\"Novo\"/>");
                out.println("</form>");
                out.println("<hr/>");
                out.println("<table border='2'>");
                out.println("<tr><th>Números</th><th>Adicão</th><th>Subtração</th><th>Multiplicação</th><th>Divisão</th></tr>");
                out.println("<tr><th>"+n1+" e "+n2+"</th><td>"+(n1+n2)+"</td><td>"+(n1-n2)+"</td><td>"+(n1*n2)+"</td><td>"+(n1/n2)+"</td></tr>");
                
            }catch(Exception ex){
                out.println("<p style='color:red'>"+ex.getMessage()+"</p>");
            }
            out.println("</table>");
            out.println("<hr/>");
            out.println("<h3><a href='index.html'>Voltar</a></h3>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
