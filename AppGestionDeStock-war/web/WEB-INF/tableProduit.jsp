<%@page import="Entites.Marque"%>
<%@page import="EjbSession.MarqueFacadeLocal"%>
<%@page import="javax.ejb.EJB"%>
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
        <title>Produits</title>
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
                        <h2 style="margin-bottom: 20px">Produits</h2>
                        
                        
                        <div class="card mb-4">
                            <div class="row card-header">
                                <div class="col-md-6 col-sm-4 col-xs-0">
                                    <button class="btn pull-right" style=" width:200px; background-color: #1c355e;"><a href="/AppGestionDeStock-war/CreationProduit" style=" text-decoration:none; color:white;"> <i class="fas fa-plus"></i> Ajouter Produit  </a></button>
                                </div>
                                <div class="col-md-6 col-sm-4 col-xs-0">
                                    <form action="http://localhost:8080/AppGestionDeStock-war/Produits" method="POST">
                                    <select class="form-select" aria-label="Default select example" name="marque" style=" width:240px; margin-left: 290px;" onchange="this.form.submit();" >
                                    <option selected><%= (String)request.getAttribute("MarqueSelectionnee") %></option>
                                    <% 
                                        List<Marque> LsMarque = (List<Marque>) request.getAttribute("ListMarque");
                                            for (int i = 0; i < LsMarque.size(); i++){
                                    %>
                                            <option value="<%= LsMarque.get(i).getNomMarque() %>"><%= LsMarque.get(i).getNomMarque() %></option>
                                    <% } %>
                                            <option value="Toutes les marques"><%= "Toutes les marques" %></option>
                                    </select>
                                    </form>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table " id="dataTable" width="100%" cellspacing="0" style="border: 1px solid rgba(0, 0, 0, 0.125); border-radius: 5px;">
                                        <thead>
                                            <tr>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Référence</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Marque</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">denomination</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Prix(dhs)</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Poids(kg)</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Volume(m^3)</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Action </th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Référence</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Marque</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">denomination</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Prix</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Poids</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Volume</th>
                                                <th style="text-align: center; border: 0.5px solid rgba(0, 0, 0, 0.125);">Action</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <% 
                                                 List<Produit> LsProduits = (List<Produit>) request.getAttribute("ListProduits");
                                                    for (int i = 0; i < LsProduits.size(); i++){
                                            %>
                                            <tr>
                                                <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); "><%= LsProduits.get(i).getReferenceProduit() %></td>
                                                <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); "><%= LsProduits.get(i).getMarqueProduit().getNomMarque() %></td>
                                                <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); "><%= LsProduits.get(i).getDenomination() %></td>
                                                <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); "><%= LsProduits.get(i).getPrix() %></td>
                                                <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); "><%= LsProduits.get(i).getPoids() %></td>
                                                <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); "><%= LsProduits.get(i).getVolume() %></td>
                                                <td style="border: 0.5px solid rgba(0, 0, 0, 0.125); ">
                                                    <a href="/AppGestionDeStock-war/ModificationProduit?nom=<%= LsProduits.get(i).getReferenceProduit() %>
                                                       &nomMarque=<%= LsProduits.get(i).getMarqueProduit().getNomMarque() %>
                                                       &denomination=<%= LsProduits.get(i).getDenomination() %>
                                                       &prix=<%= LsProduits.get(i).getPrix() %>
                                                       &poids=<%= LsProduits.get(i).getPoids() %>
                                                       &volume=<%= LsProduits.get(i).getVolume() %>">Modifier </a> | 
                                                    <a href="/AppGestionDeStock-war/SuppressionProduit?nom=<%= LsProduits.get(i).getReferenceProduit() %>" >Supprimer </a></td>
                                            </tr>
                                            <%      }
                                               
                                            %>
                                        </tbody>
                                    </table>
                                </div>
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
