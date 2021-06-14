<%@page import="java.util.List"%>
<%@page import="Entites.Stock"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Articles</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
         <style>
        /* Modify the background color */
          
        .navbar-custom {
            background-color: #1c355e;
            color: white;
            text-decoration: none;
        }
        /* Modify brand and text color */
          
        .navbar-custom .navbar-brand,
        .navbar-custom .navbar-text {
         color: white;
        }
        
    </style>
    </head>
    <body class="sb-nav-fixed">
        <%@ include file="NavBar.jsp" %>
        <div id="layoutSidenav">
            <%@ include file="SideBar.jsp" %>
            <div id="layoutSidenav_content">
                <main class="bgBody">
                    <div class="container-fluid login">
                        <div class="row">
                            <div class="col-md-3 col-sm-4 col-xs-0"></div>
                            <div class="col-md-6 col-sm-8 col-xs-12" style="margin-top: 10px; border : 2px solid rgba(0, 0, 0, 0.150); padding: 40px; padding-top: 10px; padding-bottom:  20px; margin-bottom:  20px; border-radius: 5px; ">
                                <h3 style="color: #1c355e; font-weight: 28px; padding-bottom: 15px; text-align: center;">Ajouter un produit</h3>
                                <form  action="http://localhost:8080/AppGestionDeStock-war/NouvelleMarchandise" method="POST" class="form-con">
                                        
                                        <div class="mb-3 InputFormArticl">
                                            <label for="exampleInputEmail1" class="form-label">Stock</label></br>
                                            <select class="form-select" aria-label="Default select example" name="stock">
                                                <option selected>Sélectionner un stock</option>
                                                 <% 
                                                 List<Stock> LsStock = (List<Stock>) request.getAttribute("ListStock");
                                                    for (int i = 0; i < LsStock.size(); i++){
                                                %>
                                                <option value="<%= LsStock.get(i).getNomStock() %>"><%= LsStock.get(i).getNomStock() %></option>
                                                <% } %>
                                            </select>
                                        </div>
                                        <div class="mb-3 InputFormArticl">
                                          <label  class="form-label">Réference du produit </label>
                                          <input type="text" class="form-control" name = "reference" placeholder="réference..." id="" aria-describedby="">
                                        </div>
                                        <div class="mb-3 InputFormArticl">
                                          <label  class="form-label">Quantité</label>
                                          <input type="text" class="form-control" name = "quantite" placeholder="quantité..." id="" aria-describedby="">
                                        </div>
                                        <button type="submit" class="btn " style="width: 300px; margin-left: 100px; color: white; background-color: #1c355e; font-weight: 140;">Enregistrer</button>
                                    
                                </form>
                            <div class="col-md-3 col-sm-4 col-xs-0"></div>
                         </div>
                     </div>
                    </div>
                    
                </main>
                
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
    </body>
</html>            
      

