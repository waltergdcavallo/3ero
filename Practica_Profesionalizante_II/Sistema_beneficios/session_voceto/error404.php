
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error 4040 - Pag No Encontrada</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
 
 
   <?php
     
     include('header.php');

   ?>
      
            
    
   <!-- Esta página contiene una imágen de Error 404 (Página No Encontrada) --> 

   
   
  <section>
   
  
  <!-- ERROR 404 Página No Encontrada  -->

  <div class="container"> 
    <div class="card bg-white border-secondary mt-5 mb-5">  
    <div class="jumbotron">
    <div class="row cont_img_accesoerror mt-2 mb-5"> 

      <div class="text-center lead mt-5 mb-2"><h3><strong>Upss HA OCURRIDO UN ERROR!</strong></h3>
      <img src="imagenes/error404.jpg" class="img-fluid" alt="Error 404"></div> 

      <?php
        if (isset($_GET["pag"])){
     
            echo "<div class='text-center lead mb-2'><h3><strong>AÚN NO REALIZASTE TU PÁGINA ".$_GET["pag"]." !!!</strong></h3>";
         
        }
      ?>
        
   </div> 

   

  </section>


  <?php
    include('footer.php');
  ?>
   
   <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>