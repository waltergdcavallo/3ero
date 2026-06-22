<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
 
 
   <?php
     
     include('header.php');

   ?>
      
                
   <!-- Index.php Página Principal del Sitio --> 

     
  <section class="container">

  <div class="text-center my-5 text text-primary">
    <h3>Agregar productos</h3>
  </div>



  <form action="agregar_datos.php" method="post" enctype="multipart/form-data">

<div class="row">  
  
  <div class="col-6 mb-3">
    <label for="exampleFormControlInput1" class="form-label">* Código producto</label>
    <input type="text" class="form-control" id="codigo" name="codigo">
  </div>
  <div class="col-6 mb-3">
    <label for="exampleFormControlInput1" class="form-label">* Nombre</label>
    <input type="text" class="form-control" id="nombre" name="nombre">
  </div>
  <div class="col-6 mb-3">
    <label for="exampleFormControlInput1" class="form-label">* Precio</label>
    <input type="text" class="form-control" id="precio" name="precio">
  </div>
  <div class="col-6 mb-3">
    <label for="exampleFormControlInput1" class="form-label">* Stock</label>
    <input type="text" class="form-control" id="stock" name="stock">
  </div>
<div class="mb-5 col-12">
    <select class="form-select" aria-label="Default select example" id="categoria" name="categoria">
    <option selected>Seleccione categoría</option>
    <option value="1">ACCESORIO</option>
    <option value="2">ALMACENAMIENTO</option>
    <option value="3">PERIFERICO</option>
  </select>
</div>

  <div class="mb-3 col-12">
    <label for="exampleFormControlInput1" class="form-label">* Adjuntar imagen del producto</label>
    <input type="file" class="form-control" id="archivo" name="archivo">
  </div>

  <div class="text-center">

    <button type="submit" class="btn btn-primary">Agregar</button>
    
    <button type="reset" class="btn btn-primary">Cancelar</button>
  </div>
</div>

</form>
  <?php

    if (isset($_GET["mensaje"])){

    	 if($_GET["mensaje"]!="ok"){

         echo "<div class='text-center mt-4 mb-5'><div class='alert alert-danger' role='alert'><strong>".$_GET["mensaje"]."</strong></div></div>"; 
         
       }else{

                 
        echo "<div class='text-center mt-4 mb-5'><div class='alert alert-success' role='alert'><strong>Producto Agregado!</strong></div></div>";  
       
       }  
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