<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
 
 
   <?php
     
     include('header.php');

   ?>
      
                
   <!-- Index.php Página Principal del Sitio --> 

     
  <section class="container">


<div class="row">
  <div class="text-center my-5 text text-danger">
    <h3>Borrar productos</h3>
  </div>

  <div class="mb-3 col-6">
    <label for="exampleFormControlInput1" class="form-label">* Código producto</label>
    <input class="form-control" type="text" placeholder="Disabled input" aria-label="Disabled input example" disabled>
  </div>
  <div class="mb-3 col-6">
    <label for="exampleFormControlInput1" class="form-label">* Nombre</label>
    <input class="form-control" type="text" placeholder="Disabled input" aria-label="Disabled input example" disabled>
  </div>
  <div class="mb-3 col-6">
    <label for="exampleFormControlInput1" class="form-label">* Precio</label>
    <input class="form-control" type="text" placeholder="Disabled input" aria-label="Disabled input example" disabled>
  </div>
  <div class="mb-3 col-6">
    <label for="exampleFormControlInput1" class="form-label">* Stock</label>
    <input class="form-control" type="text" placeholder="Disabled input" aria-label="Disabled input example" disabled>
  </div>
  <div class="text-center">
    <p>¿Confirma la eliminación de este producto?</p>
    <button type="button" class="btn btn-primary">Eliminar</button>
    <button type="button" class="btn btn-primary">Cancelar</button>
  </div>
</div>


</section>
  

  <?php
    include('footer.php');
  ?>
   
   <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>