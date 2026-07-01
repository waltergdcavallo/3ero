<?php

 session_start();

 if (!isset($_SESSION["dniadmin"])) {
    // Si NO hay sesión de administrador iniciada chequea si hay sesion como cliente
    if (isset($_SESSION["dnicli"])) {
        // Si hay sesion como cliente redirige a la pagina de inicio del cliente
        header("Location: inicio_cli.php"); 
    } else {
         // Si NO hay sesion ni como administrador ni como cliente redirige al index
        header("Location: index.php");
    }
    exit;
}

?>



<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio Administrador</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
 
 
      <?php
        include('header.php');

      ?>
      
            
    
   <!-- inicio_admin.php contiene la página Inicial del usuario con perfil Administrador--> 

      
  <section>
  
  <div class="container"> 
    <div class="card bg-white border-secondary mt-5 mb-5">  
      <div class="jumbotron">
        <div class="row mt-2 mb-5"> 

           <div class="text-center lead mt-5 mb-5"><h3><strong>ACCESO EXCLUSIVO PARA ADMINISTRADOR</strong></h3></div>
            <div class='text-center lead mt-5 mb-5'><h3><strong>BIENVENIDO/A AL PANEL DEL ADMINISTRADOR!!!</strong></h3></div>  
          
        </div>>
     </div>
   </div> 
 </div>   
  

</section>

  <?php
    include('footer.php');
  ?>
   
   <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>