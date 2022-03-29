<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Nueva tarea</h1>
        <form action="ControladorServlet" method="post">
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type="text" name="id" value="0"></td>
                </tr>
                 <tr>
                    <td>Tarea</td>
                    <td><input type="text" name="tarea" value=""></td>
                </tr>
                 <tr>
                    <td></td>
                    <td><input type="submit" value="procesar"></td>
                </tr>
            </table> 
        </form>

        <a href="index.jsp">Volver</a>
        <br>
    </body>
</html>
