<?php

  require_once "conexion.php";
  
  $id_venta=$_POST['id_venta'];

  $sql="select * from venta where id_venta=?";

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
    <title>Eliminar venta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
     
    <section class="container">

        <div class="text-center my-5 text text-danger">
            <h3>Borrar producto</h3>
        </div>

        <form action="../../eliminar/eliminar_venta.php" method="post">
            <input type="hidden" name="id_venta" id="id_venta" value="<?php echo $fila["id_venta"];?>">

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

                <div class="text-center">
                    <p>¿Confirma la eliminación de esta venta?</p>
                    <button type="submit" class="btn btn-primary">Eliminar</button>
                    <button type="reset" class="btn btn-primary">Cancelar</button>
                </div>
            </div>

        </form>
    </section>

   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

</body>

</html>