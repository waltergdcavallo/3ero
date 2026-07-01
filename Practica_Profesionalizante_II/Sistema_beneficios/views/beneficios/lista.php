<?php

    require_once "../../conexion.php";

    $sql="select *, (producto.nombre) as nombreprod, (beneficio.nombre) as nombrebene from beneficio, producto where (beneficio.id_beneficio=producto.id_beneficio) order by beneficio.nombre asc";

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
    <title>Listado de beneficios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>

    <div class="text-center">
        <div class="text-center my-5">
            <h3>Listado de Beneficios</h3>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-10"></div>

                    <div class="col-2">
                    <a href="form.php" class="btn btn-primary">Agregar</a>
                    <div>

                </div>
            </div>
        </div>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">Nombre</th>
                    <th scope="col">Fecha de inicio</th>
                    <th scope="col">Fecha de fin</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Producto relacionado</th>
                    <th scope="col">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if($result->num_rows>0){
                    while($fila=$result->fetch_assoc()){

                ?>
                <tr>
                    <td><?php echo $fila["nombrebene"]; ?></td>
                    <td><?php echo $fila["fecha_inicio"]; ?></td>
                    <td><?php echo $fila["fecha_fin"]; ?></td>
                    <td><?php if($fila["estado"]===1){
                            echo "Activo";
                        } elseif ($fila["estado"]===0){
                            echo "Terminado";
                        };?>
                    </td>
                    <td><?php echo $fila["descripcion"]; ?></td>
                    <td><form action="../productos/detalle.php" method="post">
                        <input type="hidden" name="id_producto" id="id_producto" value="<?php echo $fila["id_producto"];?>">
                        <button type="submit" class="btn btn-link"><?php echo $fila["nombreprod"]; ?></button></form></td>
                    <td>

                    <div class="d-sm-inline-block">
                        <form action="form.php" method="post">
                            <input type="hidden" name="id_beneficio" id="id_beneficio" value="<?php echo $fila["id_beneficio"];?>">
                            <button class="btn btn-success p-1" type="submit">Editar beneficio</button>
                        </form>
                    </div>
                    
                    <div class="d-sm-inline-block">
                        <form action="detalle.php" method="post">
                            <input type="hidden" name="id_beneficio" id="id_beneficio" value="<?php echo $fila["id_beneficio"];?>">
                            <button class="btn btn-primary p-1" type="submit">Ver Detalle</button>
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
                    <div class="alert alert-danger text-center">No existen Beneficios en la tabla</div>
                </tr>
                <?php
                }
                ?>
            </tbody>
        </table>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>