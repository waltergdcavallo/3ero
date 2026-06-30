<?php

    require_once "../../conexion.php";
    
    $id_beneficio=$_POST['id_beneficio'];

    $sql="select * from beneficio, producto, detalle_venta where (producto.id_beneficio=beneficio.id_beneficio) and (detalle_venta.id_producto=producto.id_producto) and beneficio.id_beneficio=?";

    $stmt=$conex->prepare($sql);

    $stmt->bind_param("i", $id_beneficio);

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
        Beneficio <?php $fila["nombre"]?>
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
     
    <section class="container">

        <div class="text-center my-5 text text-primary">
            <h3>Beneficio <?php echo $fila["nombre"]?></h3>
        </div>
    
        <div class="row">

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Fecha de inicio</label>
                <input class="form-control" type="text" value="<?php echo $fila['fecha_inicio'];?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">fecha fin del beneficio</label>
                <input class="form-control" type="text" value="<?php echo $fila['fecha_fin'];?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Estado</label>
                <input class="form-control" type="text" value="<?php if($fila['estado']===1)
                    {echo "Activo";
                    }else {echo "Terminado";
                    } ?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Descripción</label>
                <input class="form-control" type="text" value="<?php echo $fila['descripcion'];?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="d-sm-inline-block">
                <form action="../../public/actions/beneficios/eliminar.php" method="post">
                    <input type="hidden"name="id_beneficio" id="id_beneficio" value="<?php echo $fila["id_beneficio"];?>">
                    <input type="hidden"name="id_producto" id="id_producto" value="<?php echo $fila["id_producto"];?>">
                    <input type="hidden"name="id_detalle_venta" id="id_detalle_venta" value="<?php echo $fila["id_detalle_venta"];?>">
                    <button class="btn btn-danger p-1" type="submit">Eliminar</button>
                </form>
            </div>
    
        </div>
    
    </section>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

</body>

</html>