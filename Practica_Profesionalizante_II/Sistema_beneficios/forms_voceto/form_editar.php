<?php

require_once "conexion.php";

if(!isset(($_GET["mensaje"]))){


$idprod=$_POST['id'];

$sql="select * from productos where id=?";

$stmt=$conex->prepare($sql);

$stmt->bind_param("i", $idprod);

$stmt->execute();

$resultado=$stmt->get_result();

$fila=$resultado->fetch_assoc();

}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar</title>
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
  <div class="text-center my-5 text text-success">
    <h3>Editar datos productos</h3>
  </div>

  <form action="editar_datos.php" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" id="id" value="<?php echo $fila["id"];?>">
<div class="row">
<div class="mb-3 col-6">
    <label for="exampleFormControlInput1" class="form-label">* Código producto</label>
    <input type="text" class="form-control" id="codigo" name="codigo" value="<?php if(!isset($_GET['mensaje'])){ echo $fila['Idproducto'];}?>" disabled>
  </div>
  <div class="mb-3 col-6">
    <label for="exampleFormControlInput1" class="form-label">* Nombre</label>
    <input type="text" class="form-control" id="nombre" name="nombre" value="<?php if(!isset($_GET['mensaje'])){ echo $fila['NombreProd'];}?>">
  </div>
  <div class="mb-3 col-6">
    <label for="exampleFormControlInput1" class="form-label">* Precio</label>
    <input type="text" class="form-control" id="precio" name="precio" value="<?php if(!isset($_GET['mensaje'])){ echo $fila['Precio_venta'];}?>">
  </div>
  <div class="mb-3 col-6">
    <label for="exampleFormControlInput1" class="form-label">* Stock</label >
    <input type="text" class="form-control" id="stock" name="stock" value="<?php if(!isset($_GET['mensaje'])){ echo $fila['Stock'];}?>">
  </div>
  <div class="mb-3 col-6">
    <label for="exampleFormControlInput1" class="form-label">* Imagen actual</label>
    <img src="<?php echo 'imagenes/'.$fila["nombreimagen"]; ?>" alt="" class="w-25 img-fluid">
  </div>
  <div class="mb-3 col-6">
    <label for="exampleFormControlInput1" class="form-label">* Adjuntar imagen nueva</label>
    <input type="file" class="form-control" id="archivo" name="archivo" value="<?php if(!isset($_GET['mensaje'])){ echo "imagenes/".$fila['nombreimagen'];}?>">
  </div>
  <div class="text-center">
    <button type="submit" class="btn btn-primary">Actualizar</button>
    <button type="reset" class="btn btn-primary">Cancelar</button>
  </div>
</div>
</div>

</form>
</section>

<?php

  if (isset($_GET["mensaje"])){

    if($_GET["mensaje"]!="ok"){

      echo "<div class='text-center mt-4 mb-5'><div class='alert alert-danger' role='alert'><strong>".$_GET["mensaje"]."</strong></div></div>"; 

    }else{

        echo "<div class='text-center mt-4 mb-5'><div class='alert alert-success' role='alert'><strong>Producto Editado!</strong></div></div>";  
       
       }  
  } 
  ?> 
  

  <?php
    include('footer.php');
  ?>
   
   <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>