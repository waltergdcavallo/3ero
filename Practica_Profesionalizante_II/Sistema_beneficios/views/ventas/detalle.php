<?php

    require_once "../conexion.php";

    $id_venta=35; //$id_venta=$_POST["id_venta"];

    $sql="select *, (venta.monto-producto.precio*detalle_venta.cant_prod) as ganancia, producto.nombre as nombre_producto, (producto.precio*detalle_venta.cant_prod) as precio_bruto, concat(usuario.nombre,', ', usuario.apellido) as nombre_y_apellido from detalle_venta, venta, producto, usuario where (detalle_venta.id_venta=venta.id_venta) and (venta.id_usuario=usuario.id_usuario) and venta.id_venta=?";

    $stmt=$conex->prepare($sql);
    
    $stmt->bind_param("i", $id_venta);
    
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
    <title>
        Detalle de la venta
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
     
    <section class="container">

        <div class="text-center my-5 text text-primary">
            <h3>Venta</h3>
        </div>
    
        <div class="row">

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Monto</label>
                <input class="form-control" type="text" value="<?php echo $fila['monto'];?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Entregado</label>
                <input class="form-control" type="text" value="<?php if($fila['entregado']===1)
                    {echo "Si";
                    }else {echo "No";
                    } ?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Pagado</label>
                <input class="form-control" type="text" value="<?php if($fila['pagado']===1)
                    {echo "Si";
                    }else {echo "No";
                    } ?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Fecha de la venta</label>
                <input class="form-control" type="text" value="<?php echo $fila['fecha_venta'];?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Nombre y apellido del vendedor</label>
                <input class="form-control" type="text" value="<?php echo $fila['nombre_y_apellido'];?>" aria-label="Disabled input example" disabled>
            </div>
    
        </div>
    
    </section>

    <section class="container">

        <div class="text-center my-5 text text-primary">
            <h3>Detalles de la venta</h3>
        </div>
    
        <div class="row">

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Nombre del producto</label>
                <input class="form-control" type="text" value="<?php echo $fila['nombre_producto'];?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Precio bruto</label>
                <input class="form-control" type="text" value="<?php echo $fila['precio_bruto'];?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Cantidad de productos</label>
                <input class="form-control" type="text" value="<?php echo $fila['cant_prod'];?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Fecha de entrega</label>
                <input class="form-control" type="text" value="<?php echo $fila['fecha_entrega'];?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Ganancia</label>
                <input class="form-control" type="text" value="<?php echo $fila['ganancia'];?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="text-center">
                <a href="../editar/form_editar_venta.php"><button type="button" class="btn btn-primary">Editar venta</button></a>
                <a href="../eliminar/form_eliminar_venta.php"><button type="button" class="btn btn-danger">Eliminar venta</button>
            </div>

        </div>
    
    </section>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

</body>

</html>