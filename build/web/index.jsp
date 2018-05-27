<%-- 
    Document   : index
    Created on : 26/05/2018, 11:30:28 PM
    Author     : Susi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <body>    
        <form id="fracForm" name="Operaciones" action="Operaciones.jsp" method="POST">
              <section
                    <label>Fracción 1</label>
                 
                        <input class="numerador" type="text" name="n1" placeholder="Numeador" required autocomplete="off"/>
              </section>
                        
                          <section
                                 <label>Fracción 1</label>
                        <input class="denominador" type="text" name="d1" placeholder="Denominador" required autocomplete="off"/>
        </section>
            
                    <section
                    <label>Fracción 2</label>
                 
                        <input class="numerador" type="text" name="n2" placeholder="Numeador" required autocomplete="off"/>
              </section>
                        
                          <section
                                 <label>Fracción 2</label>
                        <input class="denominador" type="text" name="d2" placeholder="Denominador" required autocomplete="off"/>
        </section>
            
                <input id="send" type="submit" value="Solve" name="send" />
            
        </form>
    </body>
</html>

