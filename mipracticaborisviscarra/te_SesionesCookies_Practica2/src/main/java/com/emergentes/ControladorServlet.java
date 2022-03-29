
package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ControladorServlet", urlPatterns = {"/ControladorServlet"})
public class ControladorServlet extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        {
        int contador =0;
        

        Cookie cukis[] = request.getCookies();
        
        if(cukis != null){
            for(Cookie c : cukis){
                if (c.getName().equals("visitas")){

                    contador = Integer.parseInt(c.getValue());
                }
            }
        }
        
        
        contador = contador + 1;

        Cookie c = new Cookie("visitas",Integer.toString(contador));
        
        c.setMaxAge(30);
        response.addCookie(c);

        response.setContentType("text/html");
        
        PrintWriter out = response.getWriter();
        out.println("Visitante N "+ contador);
        }
        
        
        
        
        String op = request.getParameter("op");
        
        if(op.equals("vaciar")){
            
            HttpSession ses = request.getSession();
            
            ses.invalidate();
            
            response.sendRedirect("index.jsp");
            
        }
        if (op.equals("eliminar")){
            int pos = -1;
            int buscado = -1;
            int id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();
            ArrayList<Tareas> lista = (ArrayList<Tareas>)ses.getAttribute("almacena");
            
            for(Tareas t : lista){
                pos++;
                if(t.getId() == id){
                    buscado = pos;
                }
            }
            lista.remove(buscado);
            response.sendRedirect("index.jsp");
        }      
           
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

        int id = Integer.parseInt(request.getParameter("id"));
        String tarea = request.getParameter("tarea");
        String[] completado = request.getParameterValues("completado");
        Tareas objenc = new Tareas();
        objenc.setId(id);
        objenc.setTarea(tarea);
        objenc.setCompletado(completado);
        HttpSession ses = request.getSession();
        
        ArrayList<Tareas> lista = (ArrayList<Tareas>)ses.getAttribute("almacena");
        
        lista.add(objenc);
        
        response.sendRedirect("index.jsp");
    }

}
