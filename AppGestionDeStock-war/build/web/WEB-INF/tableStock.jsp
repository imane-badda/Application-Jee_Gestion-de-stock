<%@page import="Entites.Stock"%>
<%@page import="Entites.Produit"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Stock</title>
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
                <main>
                    <div class="container-fluid">
                        <h2 style="margin-bottom: 20px">Stock</h2>
                        
                        
                        <div class="card mb-4">
                            <div class="row card-header">
                                <div class="col-md-6 col-sm-4 col-xs-0">
                                    <button class="btn pull-right" style=" width:260px; background-color: #1c355e;">
                                        <a href="/AppGestionDeStock-war/NouvelleMarchandise" style=" text-decoration:none; color:white; "> <i class="fas fa-plus"></i> Nouvelle marchandise   </a>
                                    </button>
                                </div>
                                <div class="col-md-6 col-sm-4 col-xs-0">
                                    <form action="http://localhost:8080/AppGestionDeStock-war/Stock" method="POST">
                                    <select class="form-select" aria-label="Default select example" name="nomStock" style=" width:240px; margin-left: 270px;" onchange="this.form.submit();" >
                                    <option selected><%= (String)request.getAttribute("StockSelectionne") %></option>
                                    <% 
                                        List<Stock> LsStock = (List<Stock>) request.getAttribute("ListDesStocks");
                                            for (int i = 0; i < LsStock.size(); i++){
                                    %>
                                            <option value="<%= LsStock.get(i).getNomStock() %>"><%= LsStock.get(i).getNomStock() %></option>
                                    <% } %>
                                            <option value="Tous les stocks"><%= "Tous les stocks" %></option>
                                    </select>
                                    </form>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table " id="dataTable" width="100%" cellspacing="0" style="border: 1px solid rgba(0, 0, 0, 0.125); border-radius: 5px;">
                                        <thead>
                                            <tr>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Nom</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Produit</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Quantité</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125); width: 200px;">Action </th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Nom</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Produit</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Quantité</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125); width: 200px;">Action </th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <% 
                                                List<Stock> LsStockSelected = (List<Stock>) request.getAttribute("ListStock");
                                                for (int i = 0; i < LsStockSelected.size(); i++){
                                            %>
                                            <tr>
                                                <% if(LsStockSelected.get(i).getListeStock()!=null) {%>
                                                <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); " rowspan="<%= LsStockSelected.get(i).getListeStock().getListElementStock().size() %>"><%= LsStockSelected.get(i).getNomStock() %></td>
                                                <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); "><%= LsStockSelected.get(i).getListeStock().getListElementStock().get(0).getRefProduit() %></td>
                                                <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); "><%= LsStockSelected.get(i).getListeStock().getListElementStock().get(0).getQuantite() %></td>
                                                <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); width: 200px; text-align: center">
                                                    <a href="/AppGestionDeStock-war/ModificationStock?nomStock=<%= LsStockSelected.get(i).getNomStock()%>&nomProd=<%= LsStockSelected.get(i).getListeStock().getListElementStock().get(0).getRefProduit() %>&QuantiteProd=<%= LsStockSelected.get(i).getListeStock().getListElementStock().get(0).getQuantite() %>" >Modifier(Entrée/Sortie) </a> 
                                                </td>
                                            </tr>
                                            
                                            <% 
                                               for (int j = 1; j < LsStockSelected.get(i).getListeStock().getListElementStock().size() ; j++){
                                            %>
                                                <tr>
                                                    <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); "><%= LsStockSelected.get(i).getListeStock().getListElementStock().get(j).getRefProduit() %></td>
                                                    <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); "><%= LsStockSelected.get(i).getListeStock().getListElementStock().get(j).getQuantite() %></td>
                                                    <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); width: 200px; text-align: center">
                                                        <a href="/AppGestionDeStock-war/ModificationStock?nomStock=<%= LsStockSelected.get(i).getNomStock()%>&nomProd=<%= LsStockSelected.get(i).getListeStock().getListElementStock().get(j).getRefProduit() %>&QuantiteProd=<%= LsStockSelected.get(i).getListeStock().getListElementStock().get(j).getQuantite() %>" >Modifier(Entrée/Sortie) </a>
                                                    </td>
                                                </tr>
                                            <%  } 
                                               }else{ %>
                                               <tr>
                                                    <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); "><%= LsStockSelected.get(i).getNomStock() %></td>
                                                    <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); "></td>
                                                    <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); "></td>
                                                    <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); width: 200px; text-align: center"> 
                                                    </td>
                                                </tr>
                                            <%} }%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                            <form  action="http://localhost:8080/AppGestionDeStock-war/CreationStock" method="POST" class="form-con">  
                                <div class="row" style="margin : 3px; margin-top: 50px; border: 0.5px solid rgba(0, 0, 0, 0.125); border-radius: 3px; padding-top: 20px; background-color: lightblue; ">
                                    <div class="col-md-4 col-sm-4 col-xs-0">
                                        <h5>Ajouter un nouveau stock :</h5>
                                    </div>
                                    <div class="mb-3 InputFormArticl col-md-4 col-sm-4 col-xs-0">
                                        <input type="text" class="form-control" name = "nomStock" placeholder="Nom du stock..." id="" aria-describedby="">
                                    </div>
                                    <div class="col-md-3 col-sm-4 col-xs-0">
                                        <button type="submit" class="btn " style="width: 150px; margin-left: 90px; color: white; background-color: #1c355e; font-weight: 140;">Enregistrer</button>
                                    </div>
                                </div>
                            </form>     
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