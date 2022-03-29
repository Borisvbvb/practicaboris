<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Tareas"%>
<%
 
    if (session.getAttribute("almacena") == null){
        ArrayList<Tareas> lisaux = new ArrayList<Tareas>();
        session.setAttribute("almacena", lisaux);
    }
    ArrayList<Tareas> almacena = (ArrayList<Tareas>)session.getAttribute("almacena");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h2>Tareas Pendientes</h2>
        <a href="ControladorServlet">Visita</a>
        <a href="nuevo.jsp">Nuevo</a>
        <br>
        
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Tarea</th>
                <th>Completado</th>
                <th></th>
            </tr>
            
            
             <tr>
                
                <td>1</td>
                <td>Reunion con Estudiantes de la Carrera</td>
                <td><input type="checkbox" name="completado" value=""></td>
                <td><a href="ControladorServlet?op=eliminar&id=<">Eliminar</a></td>
                
            </tr>
            
             <tr>

                <td>2</td>
                <td>Estudiar para el examen de probabilidades</td>
                <td><input type="checkbox" name="completado" value=""></td>
                <td><a href="ControladorServlet?op=eliminar&id=<">Eliminar</a></td>
                
            </tr>
            
            <tr>

                <td>3</td>
                <td>Partido de futsal</td>
                <td><input type="checkbox" name="completado" value=""></td>
                <td><a href="ControladorServlet?op=eliminar&id=<">Eliminar</a></td>
                
            </tr>
            <%
              if   (almacena != null){
                  for(Tareas t : almacena){                  
            %>
            <tr>
                <td><%= t.getId() %> </td>
                <td>  <%= t.getTarea() %> </td>
                <td>     <input type="checkbox" name="completado" >      </td>
                <td><a href="ControladorServlet?op=eliminar&id=<%= t.getId() %>">Eliminar</a></td>
            </tr>
            <%
                  }
                }
            %>
        </table>  
        

    </body>
</html>
