<%-- 
    Document   : Operaciones
    Created on : 26/05/2018, 11:36:55 PM
    Author     : Susi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    class Fraccion {
        public int numerador;
        public int denominador;

        public Fraccion (int n, int d){
            this.numerador = n;      
            this.denominador = d;
        }
        public Fraccion(){}

        public int returnNumerador() {
            return this.numerador;
        }
        public int returnDenominador() {
            return this.denominador;
        }
    }

    class OpFracciones {
        Fraccion F1;
        Fraccion F2;

        public OpFracciones(Fraccion I1,Fraccion I2) {
            this.F1 = I1;
            this.F2 = I2;
        }

        public Fraccion Suma() {
            int resden = this.F1.returnDenominador() * this.F2.returnDenominador();     
            int t1 = this.F1.returnNumerador() * this.F2.returnDenominador();
            int t2 = this.F1.returnDenominador() * this.F2.returnNumerador();
            int resnum = t1 + t2;
            Fraccion res = new Fraccion(resnum, resden);
            res = simplificar(res);
            return res;
        }

        public Fraccion Resta() {
            int resden = this.F1.returnDenominador() * this.F2.returnDenominador();     
            int t1 = this.F1.returnNumerador() * this.F2.returnDenominador();
            int t2 = this.F1.returnDenominador() * this.F2.returnNumerador();
            int resnum = t1 - t2;
            Fraccion res = new Fraccion(resnum, resden);
            res = simplificar(res);
            return res;
        }

        public Fraccion Multiplicacion() {
            int resnum = this.F1.returnNumerador() * this.F2.returnNumerador();
            int resden = this.F1.returnDenominador() * this.F2.returnDenominador();
            Fraccion res = new Fraccion(resnum, resden);
            res = simplificar(res);
            return res;
        }

        public Fraccion Division() {
            int resnum = this.F1.returnNumerador() * this.F2.returnDenominador();
            int resden = this.F1.returnDenominador() * this.F2.returnNumerador();        
            Fraccion res = new Fraccion(resnum, resden);
            res = simplificar(res);
            return res;
        }

        private Fraccion simplificar(Fraccion temp) {
            if(temp.returnDenominador() == 0)
                return temp;
            int i;
            for(i = 2; i < 100; i++)
            {
                if((i == 2 || i == 3 || i == 5 || i == 7) || ((i % 2)!= 0 && (i % 3)
                        != 0 && (i % 5) != 0 && (i % 7) != 0))
                {
                    if(temp.returnNumerador() % i == 0 && temp.returnDenominador()
                            % i == 0)
                    {
                        temp.numerador /= i;
                        temp.denominador /= i;
                        i = 1;
                    }
                }
            }
            return temp;
        }
    }

    int num1 = Integer.parseInt(request.getParameter("n1"));
    int den1 = Integer.parseInt(request.getParameter("d1"));
    int num2 = Integer.parseInt(request.getParameter("n2"));
    int den2 = Integer.parseInt(request.getParameter("d2"));

    Fraccion aux = new Fraccion();
    Fraccion fracc1 = new Fraccion(num1, den1);
    Fraccion fracc2 = new Fraccion(num2, den2);

    OpFracciones myOp = new OpFracciones(fracc1, fracc2);
    int higherFracc;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jsp Page</title>
       
    </head>
    <body>
     
    </thead>
          
<section
                    <label>F1 = </label>  
    
                        <%= fracc1.returnNumerador()%>/<%= fracc1.returnDenominador()%>
</section>
                        <section
                <label>F2 = </label>
                        <%= fracc2.returnNumerador()%>/<%= fracc2.returnDenominador()%>
</section>
               <section
                    <label>F1 + F2 = </label>
                 
                    <%
                        aux = myOp.Suma();                        
                    %>
                    
                        <%= aux.returnNumerador()%>/<%= aux.returnDenominador()%>
                  </section>
                      <section
                    <label>F1 - F2 = </label>
                 
                      
        
                    <%
                        aux = myOp.Resta();     
                        if (aux.returnNumerador() > 0) 
                            higherFracc = 1;
                        else if (aux.returnNumerador() < 0)
                            higherFracc = 2;
                        else
                            higherFracc = 0;
                    %>
                    
                        <%= aux.returnNumerador()%>/<%= aux.returnDenominador()%>
                  </section>
                   <section
                    <label>F1 * F2 = </label>
                 
                    <%
                        aux = myOp.Multiplicacion();                       
                    %>
                   
                        <%= aux.returnNumerador()%>/<%= aux.returnDenominador()%>
                   </section>
                   <section
                    <label>F1 / F2 = </label>
                 
                    <%
                        aux = myOp.Division();                       
                    %>
                    
                        <%= aux.returnNumerador()%>/<%= aux.returnDenominador()%>
                   </section>
                    <section
                    <label>La fraccion mayor es = </label>
                 
                        <% 
                           if (higherFracc == 1) {
                        %>                              
                            <%= "F1" %>
                        <% 
                           } else if (higherFracc == 2) {
                        %>
                            <%= "F2" %>
                        <% 
                           } else {
                        %>
                            <%= "Son iguales" %>
                        <%}%>
                    </section>
    </body>
</html>
