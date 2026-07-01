<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
    

<section class="container mt-5">
    <div class="row text-center">
        <form action="agregarUsuario.php" method="post" class="bg-dark p-5">

            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="dni" name="dni" placeholder="DNI">
                <label for="floatingInput">DNI</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                <label for="floatingPassword">Nombre</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido">
                <label for="floatingPassword">Apellido</label>
            </div>
            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="email" name="email" placeholder="Ejemplo@gmail.com">
                <label for="floatingPassword">Email</label>
            </div>
            <div class="form-floating mb-3">
                <input type="password" class="form-control" id="clave" name="clave" placeholder="Contraseña">
                <label for="floatingPassword">Contraseña</label>
            </div>

            <button type="submit" class="btn btn-success p3 mt-5">Registrarse</button>
            <button type="reset" class="btn btn-danger p3 mt-5">Cancelar</button>

        </form>
    </div>
    <?php
    if (isset($_GET["mensaje"])){
        if($_GET["mensaje"]=="ok"){
            }else{
                echo "<div class='alert alert-danger'>".$_GET["mensaje"]."</div>";
            }
        }
    ?>

</section>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>