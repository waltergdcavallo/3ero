<?php

  require_once "conexion.php";
  
  $idprod=$_POST['id'];

  $sql="select * from productos where id=?";

  $stmt=$conex->prepare($sql);

  $stmt->bind_param("i", $idprod);

  $stmt->execute();

  $resultado=$stmt->get_result();

  $fila=$resultado->fetch_assoc();



?>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
 
 
   <?php
     
     include('header.php');

   ?>
      
                
   <!-- Index.php Página Principal del Sitio --> 

     
  <section class="container">


  <div class="text-center my-5 text text-danger">
    <h3>Borrar producto</h3>
  </div>

  <form action="eliminar_datos.php" method="post">
    <input type="hidden" name="id" id="id" value="<?php echo $fila["id"];?>">

<div class="row">
  <div class="mb-3 col-6">
    <label for="exampleFormControlInput1" class="form-label">* Código producto</label>
    <input class="form-control" type="text" name="codigo" id="codigo" value="<?php echo $fila['Idproducto'];?>" aria-label="Disabled input example" disabled>
  </div>
  <div class="mb-3 col-6">
    <label for="exampleFormControlInput1" class="form-label">* Nombre</label>
    <input class="form-control" type="text" name="nombre" id="nombre" value="<?php echo $fila['NombreProd'];?>" aria-label="Disabled input example" disabled>
  </div>
  <div class="mb-3 col-6">
    <label for="exampleFormControlInput1" class="form-label">* Precio</label>
    <input class="form-control" type="text" name="precio" id="precio" value="<?php echo $fila['Precio_venta'];?>" aria-label="Disabled input example" disabled>
  </div>
  <div class="mb-3 col-6">
    <label for="exampleFormControlInput1" class="form-label">* Stock</label>
    <input class="form-control" type="text" name="stock" id="stock" value="<?php echo $fila['Stock'];?>" aria-label="Disabled input example" disabled>
  </div>
  <div class="mb-3 col-12">
    <label for="exampleFormControlInput1" class="form-label">* Imagen</label>
    <img name="imagen" id="imagen" src="<?php echo 'imagenes/'.$fila["nombreimagen"]; ?>" class="w-25">
  </div>
  <div class="text-center">
    <p>¿Confirma la eliminación de este producto?</p>
    <button type="submit" class="btn btn-primary">Eliminar</button>
    <button type="reset" class="btn btn-primary">Cancelar</button>
  </div>
</div>

</form>
</section>
  

  <?php
    include('footer.php');
  ?>
   
   <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>