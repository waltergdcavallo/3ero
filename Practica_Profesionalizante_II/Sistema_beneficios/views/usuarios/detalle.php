<?php

    require_once "../../conexion.php";

    $id_usuario=5; //$id_usuario=$_POST["id_usuario"];

    $sql="select *, concat(nombre, ' ', apellido) as nombreyapellido from usuario where id_usuario=?";
    
    $stmt=$conex->prepare($sql);
    
    $stmt->bind_param("i", $id_usuario);
    
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
        Detalle del usuario
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
     
    <section class="container">

        <div class="text-center my-5 text text-primary">
            <h3>Usuario</h3>
        </div>
    
        <div class="row">

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Nombre y Apellido</label>
                <input class="form-control" type="text" value="<?php echo $fila['nombreyapellido'];?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Dni</label>
                <input class="form-control" type="text" value="<?php echo $fila['dni'];?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Teléfono</label>
                <input class="form-control" type="text" value="<?php echo $fila['telefono'];?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Email</label>
                <input class="form-control" type="text" value="<?php echo $fila['email'];?>" aria-label="Disabled input example" disabled>
            </div>

            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Dirección</label>
                <input class="form-control" type="text" value="<?php echo $fila['direccion'];?>" aria-label="Disabled input example" disabled>
            </div>
    
            <div class="mb-3 col-6">
                <label for="exampleFormControlInput1" class="form-label">Rol</label>
                <input class="form-control" type="text" value="<?php echo $fila['rol'];?>" aria-label="Disabled input example" disabled>
            </div>
    
        </div>
    
    </section>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

</body>

</html>