<?php

  require_once "conexion.php";
  
  $idprod=$_POST['id'];
  
  $sql="select productos.*, categorias.descripcion from productos, categorias where categorias.id=productos.Categoria and productos.id=?";

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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles</title>

    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="text-center container">
    <div class="text-center my-5">
        <h3>Detalle del producto</h3>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-10"></div>

                <div class="col-2">
                <a href="form_agregar.php" class="btn btn-primary">Agregar</a>
                <div>

            </div>
        </div>
    </div>

    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">Código</th>
                <th scope="col">Nombre</th>
                <th scope="col">Descripción categoría</th>
                <th scope="col">Imagen</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if($resultado->num_rows>0){
            ?>
            <tr>
                <th scope="row"><?php echo $fila["Idproducto"]; ?></th>
                <td><?php echo $fila["NombreProd"]; ?></td>
                <td><?php echo $fila["descripcion"]; ?></td>
                <td><img src="<?php echo 'imagenes/'.$fila["nombreimagen"]; ?>" alt="" class="w-25 img-fluid"></td>
            </tr>
            <?php
            }else {
            ?>
            <tr>
                <td scope="5"></td>
                <div class="alert alert-danger text-center">No existe este Producto en la tabla</div>
            </tr>
            <?php
            }
            ?>
        </tbody>
    </table>
</div>
   <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>