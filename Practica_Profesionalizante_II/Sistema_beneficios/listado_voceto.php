<?php

require_once "conexion.php";

$sql="select * from productos order by idproducto asc";

$stmt=$conex->prepare($sql);

if ($stmt->execute()){
    $result=$stmt->get_result();
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado</title>

    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="text-center container">
    <div class="text-center my-5">
        <h3>Listado de Productos</h3>
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
                <th scope="col">Descripción</th>
                <th scope="col">Precio</th>
                <th scope="col">Stock</th>
                <th scope="col">Categoría</th>
                <th scope="col">Acciones</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if($result->num_rows>0){
                while($fila=$result->fetch_assoc()){
                
            ?>
            <tr>
                <th scope="row"><?php echo $fila["Idproducto"]; ?></th>
                <td><?php echo $fila["NombreProd"]; ?></td>
                <td><?php echo $fila["Precio_venta"]; ?></td>
                <td><?php echo $fila["Stock"]; ?></td>
                <td><?php echo $fila["Categoria"]; ?></td>
                <td>
                <div class="d-sm-inline-block">
                    <form action="form_editar.php" method="post">
                        <input type="hidden" name="id" id="id" value="<?php echo $fila["id"];?>">
                        <button class="btn-sm btn-outline-success p-1" type="submit">Editar</button>
                    </form>
                </div>
                <div class="d-sm-inline-block">
                    <form action="form_eliminar.php" method="post">
                        <input type="hidden"name="id" id="id" value="<?php echo $fila["id"];?>">
                        <button class="btn-sm btn-outline-danger p-1" type="submit">Borrar</button>
                    </form>
                </div>
                <div class="d-sm-inline-block">
                    <form action="verdetalle.php" method="post">
                        <input type="hidden"name="id" id="id" value="<?php echo $fila["id"];?>">
                        <button class="btn-sm btn-outline-primary p-1" type="submit">Ver Detalle</button>
                    </form>
                </div>
                </td>
            </tr>
            <?php
                }
            }else {
            ?>
            <tr>
                <td scope="5"></td>
                <div class="alert alert-danger text-center">No existen Productos en la tabla</div>
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